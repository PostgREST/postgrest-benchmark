import argparse
import json
import math
import re
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd


VARIANT_COLUMNS = ["Version", "GHC RTS", "Extra config"]
SERIES_COLUMNS = ["VUs", "EC2", "Separate PG"]
LATENCY_METRICS = ["p50", "p90", "p95"]
METRICS = ["http_reqs (req/s)", "failed requests", *LATENCY_METRICS]


def version_key(version):
    numbers = tuple(int(part) for part in re.findall(r"\d+", version))
    return (not version.startswith("v"), numbers)


def get_variants(data):
    return sorted(
        data[VARIANT_COLUMNS].drop_duplicates().itertuples(
            index=False, name=None
        ),
        key=lambda variant: (version_key(variant[0]), variant[1:]),
    )


def variant_label(variant):
    version, rts, extra_config = variant
    return f"{version} | {rts or 'default'} | {extra_config or 'default'}"


def read_results(path):
    rows = []
    with path.open() as input_file:
        for line in input_file:
            if not line.strip():
                continue
            record = json.loads(line)
            version = record.get("POSTGREST_VERSION")
            metrics = record["metrics"]
            duration = metrics["http_req_duration"]["values"]
            failed = metrics.get("http_req_failed", {}).get("values", {})
            rows.append({
                "Version": Path(version).name if version else version,
                "K6 script": record.get("K6_SCRIPT"),
                "EC2": record.get("PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE"),
                "Separate PG": record["PGRSTBENCH_SEPARATE_PG"],
                "GHC RTS": record.get("PGRSTBENCH_GHC_RTS") or "",
                "Extra config": (
                    record.get("PGRSTBENCH_PGRST_EXTRA_CONFIG") or ""
                ),
                "VUs": int(
                    metrics.get("vus_max", metrics["vus"])["values"]["max"]
                ),
                "http_reqs (req/s)": metrics["http_reqs"]["values"]["rate"],
                "failed requests": failed.get("passes", 0),
                "p50": duration["med"],
                "p90": duration["p(90)"],
                "p95": duration["p(95)"],
                "Duration": record["state"]["testRunDurationMs"],
            })
    return pd.DataFrame(rows)


def write_markdown(data, path):
    table = data.copy()
    table["http_reqs (req/s)"] = table["http_reqs (req/s)"].map(
        lambda value: f"{value:.6f}"
    )
    table["Duration"] = table["Duration"].map(lambda value: f"{value}ms")
    for column in LATENCY_METRICS:
        table[column] = table[column].map(lambda value: f"{value:.2f}ms")
    path.write_text(
        table.to_markdown(index=False)
    )


def percentage_change(baseline, candidate):
    return (candidate / baseline.replace(0, float("nan")) - 1) * 100


def write_vs_markdown(data, path):
    variants = get_variants(data)
    if len(variants) != 2:
        return False

    baseline, candidate = variants
    layouts = {"true": "Separate PG", "false": "Colocated PG"}
    averages = data.groupby(
        ["K6 script"] + SERIES_COLUMNS + VARIANT_COLUMNS, dropna=False
    )[METRICS].mean()
    tables = []
    for metric in METRICS:
        values = averages[metric].unstack(VARIANT_COLUMNS)
        values = values.reindex(columns=pd.MultiIndex.from_tuples(
            variants, names=VARIANT_COLUMNS
        ))
        changes = percentage_change(values[baseline], values[candidate])
        table = changes.unstack(SERIES_COLUMNS).sort_index(
            axis=1, ascending=[True, True, False]
        )
        table.columns = [
            f"{vus} VUs · {instance} · {layouts[mode]}"
            for vus, instance, mode in table.columns
        ]
        table.index = [Path(str(script)).name for script in table.index]
        table.loc["Mean"] = table.mean()
        table = table.apply(lambda column: column.map(
            lambda gain: "N/A" if pd.isna(gain) else f"{gain:+.1f}%"
        ))
        table.loc["Mean"] = table.loc["Mean"].map(
            lambda value: f"**{value}**"
        )
        table = table.rename(index={"Mean": "**Mean**"})
        table = table.rename_axis("Test").reset_index()
        tables.append(f"### {metric}\n\n{table.to_markdown(index=False)}")
    description = (
        f"`{variant_label(baseline)}` vs "
        f"`{variant_label(candidate)}`"
    )
    path.write_text(description + "\n\n" + "\n\n".join(tables) + "\n")
    return True


def write_svg(data, path):
    variants = get_variants(data)
    positions = {variant: index for index, variant in enumerate(variants)}
    data = data.assign(
        _position=[positions[variant] for variant in zip(
            data["Version"], data["GHC RTS"], data["Extra config"]
        )]
    )
    data = data.sort_values(["_position", "VUs"])
    figure, axes = plt.subplots(len(METRICS), 1, figsize=(18, 18), sharex=True)
    script = data["K6 script"].iloc[0]
    duration = math.floor(data["Duration"].iloc[0] / 1000)
    figure.suptitle(
        f"K6 script: {script} | "
        f"Duration: {duration}s",
        parse_math=False,
    )
    for axis, metric in zip(axes, METRICS):
        for (vus, instance, separate_pg), group in data.groupby(
            SERIES_COLUMNS, sort=True, dropna=False
        ):
            marker, linestyle = {
                "true": ("o", "-"),
                "false": ("s", "--"),
            }[separate_pg]
            axis.plot(
                group["_position"],
                group[metric],
                marker=marker,
                linestyle=linestyle,
                label=(
                    f"{vus} VUs | {instance} | separate PG: {separate_pg}"
                ),
            )
        axis.set_title(metric)
        # TODO some charts were showing negative labels
        if metric == "failed requests":
            axis.set_ylim(bottom=0)
        axis.grid(axis="y", color="lightgray")
        axis.legend(loc="best")
    axes[-1].set_xticks(
        range(len(variants)),
        [variant_label(variant) for variant in variants],
        rotation=60,
        ha="right",
        parse_math=False,
    )
    figure.tight_layout(rect=(0, 0, 1, 0.97))
    figure.savefig(path, format="svg")
    plt.close(figure)


def main():
    parser = argparse.ArgumentParser(
        description="Generate reports from k6 JSONL summaries"
    )
    parser.add_argument("input", type=Path, help="Input JSONL file")
    args = parser.parse_args()
    data = read_results(args.input)
    if data.empty:
        raise SystemExit("empty input")
    results_dir = args.input.parent
    markdown_path = results_dir / f"{args.input.stem}.md"
    for script, script_data in data.groupby("K6 script", dropna=False):
        script_stem = Path(str(script)).stem
        svg_path = results_dir / f"{script_stem}.svg"
        write_svg(script_data, svg_path)
        print(f"Generated report: {svg_path}")
    write_markdown(data, markdown_path)
    print(f"Generated report: {markdown_path}")
    vs_path = results_dir / f"{args.input.stem}-vs.md"
    if write_vs_markdown(data, vs_path):
        print(f"Generated report: {vs_path}")
    else:
        print(f"Skipped {vs_path}: expected exactly two configurations")


if __name__ == "__main__":
    main()
