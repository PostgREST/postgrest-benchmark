import argparse
import json
import math
import re
from itertools import combinations
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd

VARIANT_COLUMNS = ["GHC RTS", "Extra config"]
SERIES_COLUMNS = ["Version", "VUs", "EC2", "Separate PG"]
LATENCY_METRICS = ["p50", "p90", "p95"]
METRICS = ["http_reqs (req/s)", "failed requests", *LATENCY_METRICS]


def report_columns(version_as_variant):
    if version_as_variant:
        return SERIES_COLUMNS[1:], [*VARIANT_COLUMNS, "Version"]
    return SERIES_COLUMNS, VARIANT_COLUMNS


def get_variants(data, variant_columns):
    return sorted(
        data[variant_columns]
        .drop_duplicates()
        .itertuples(index=False, name=None),
        key=lambda variant: (
            tuple(map(int, re.findall(r"\d+", variant[0]))),
            variant,
        ),
    )


def report_label(*parts):
    return " · ".join(map(str, parts))


def variant_label(variant):
    return report_label(*(value or "default" for value in variant))


def series_label(series):
    *version, vus, instance, separate_pg = series
    return report_label(
        *version, f"{vus} VUs", instance, f"separate PG: {separate_pg}"
    )


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
            rows.append(
                {
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
                    "http_reqs (req/s)": metrics["http_reqs"]["values"][
                        "rate"
                    ],
                    "failed requests": failed.get("passes", 0),
                    "p50": duration["med"],
                    "p90": duration["p(90)"],
                    "p95": duration["p(95)"],
                    "Duration": record["state"]["testRunDurationMs"],
                }
            )
    return pd.DataFrame(rows)


def write_markdown(data, path):
    table = data.copy()
    table["http_reqs (req/s)"] = table["http_reqs (req/s)"].map(
        lambda value: f"{value:.6f}"
    )
    table["Duration"] = table["Duration"].map(lambda value: f"{value}ms")
    for column in LATENCY_METRICS:
        table[column] = table[column].map(lambda value: f"{value:.2f}ms")
    path.write_text(table.to_markdown(index=False))


def percentage_change(baseline, candidate):
    return (candidate / baseline.replace(0, float("nan")) - 1) * 100


def write_vs_markdown(data, path, version_as_variant=False):
    series_columns, variant_columns = report_columns(version_as_variant)
    variants = get_variants(data, variant_columns)
    if len(variants) < 2:
        return False

    summary_metrics = ["http_reqs (req/s)", "p50", "p95"]
    averages = data.groupby(
        ["K6 script"] + series_columns + variant_columns, dropna=False
    )[METRICS].mean()
    comparisons = []
    for baseline, candidate in combinations(variants, 2):
        tables = []
        summary = []
        for metric in METRICS:
            values = averages[metric].unstack(variant_columns)
            values = values.reindex(
                columns=pd.MultiIndex.from_tuples(
                    variants, names=variant_columns
                )
            )
            changes = percentage_change(values[baseline], values[candidate])
            table = changes.unstack(series_columns).sort_index(axis=1)
            table.columns = [series_label(series) for series in table.columns]
            table.index = [Path(str(script)).name for script in table.index]
            table.loc["Mean"] = table.mean()
            table = table.apply(
                lambda column: column.map(
                    lambda gain: "N/A" if pd.isna(gain) else f"{gain:+.1f}%"
                )
            )
            if metric in summary_metrics:
                summary.append(table.loc["Mean"].rename(metric))
            table.loc["Mean"] = table.loc["Mean"].map(
                lambda value: f"**{value}**"
            )
            table = table.rename(index={"Mean": "**Mean**"})
            table = table.rename_axis("Test").reset_index()
            tables.append(f"### {metric}\n\n{table.to_markdown(index=False)}")
        comparisons.append(
            f"## `{variant_label(baseline)}` vs "
            f"`{variant_label(candidate)}`\n\n"
            + "### Summary\n\n"
            + pd.DataFrame(summary).rename_axis("Mean change").to_markdown()
            + "\n\n"
            + "\n\n".join(tables)
        )
    path.write_text("\n\n".join(comparisons))
    return True


def write_svg(data, path, dark_mode=False, version_as_variant=False):
    plt.style.use("dark_background" if dark_mode else "default")
    series_columns, variant_columns = report_columns(version_as_variant)
    variants = get_variants(data, variant_columns)
    positions = {variant: index for index, variant in enumerate(variants)}
    data = data.assign(
        _position=[
            positions[variant]
            for variant in data[variant_columns].itertuples(
                index=False, name=None
            )
        ]
    )
    data = data.sort_values(["_position", "VUs"])
    figure, axes = plt.subplots(len(METRICS), 1, figsize=(18, 18), sharex=True)
    script = data["K6 script"].iloc[0]
    duration = math.floor(data["Duration"].iloc[0] / 1000)
    figure.suptitle(
        report_label(f"K6 script: {script}", f"Duration: {duration}s"),
        parse_math=False,
    )
    for axis, metric in zip(axes, METRICS):
        for series, group in data.groupby(
            series_columns, sort=True, dropna=False
        ):
            axis.plot(
                group["_position"],
                group[metric],
                marker="o",
                linestyle="-",
                label=series_label(series),
            )
        if metric in LATENCY_METRICS:
            axis.yaxis.set_inverted(True)
        axis.set_title(metric)
        # TODO some charts were showing negative labels
        if metric == "failed requests":
            axis.set_ylim(bottom=0)
        axis.grid(axis="y", alpha=0.25)
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
    parser.add_argument(
        "--dark-mode",
        action="store_true",
        help="Generate SVG charts with a dark background",
    )
    parser.add_argument(
        "--version-as-variant",
        action="store_true",
        help=(
            "Group Version as a variant for the reports"
        ),
    )
    args = parser.parse_args()
    data = read_results(args.input)
    if data.empty:
        raise SystemExit("empty input")
    results_dir = args.input.parent
    markdown_path = results_dir / f"{args.input.stem}.md"
    for script, script_data in data.groupby("K6 script", dropna=False):
        script_stem = Path(str(script)).stem
        svg_path = results_dir / f"{script_stem}.svg"
        write_svg(
            script_data, svg_path, dark_mode=args.dark_mode,
            version_as_variant=args.version_as_variant,
        )
        print(f"Generated report: {svg_path}")
    write_markdown(data, markdown_path)
    print(f"Generated report: {markdown_path}")
    vs_path = results_dir / f"{args.input.stem}-vs.md"
    if write_vs_markdown(data, vs_path, args.version_as_variant):
        print(f"Generated report: {vs_path}")
    else:
        print(f"Skipped {vs_path}: expected at least two configurations")


if __name__ == "__main__":
    main()
