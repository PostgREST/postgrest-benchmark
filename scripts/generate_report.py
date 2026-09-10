import argparse
import json
import re
from pathlib import Path

import matplotlib
import pandas as pd

matplotlib.use("Agg")
import matplotlib.pyplot as plt

RESULTS_DIR = Path("results")


def version_key(version):
    return tuple(int(part) for part in re.findall(r"\d+", version))


def read_results(path):
    rows = []
    with path.open() as input_file:
        for line in input_file:
            if not line.strip():
                continue
            record = json.loads(line)
            metrics = record["metrics"]
            duration = metrics["http_req_duration"]["values"]
            rows.append({
                "Version": record.get("POSTGREST_VERSION"),
                "K6 script": record.get("K6_SCRIPT"),
                "EC2": record.get("PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE"),
                "VUs": int(metrics.get("vus_max", metrics["vus"])["values"]["max"]),
                "http_reqs (req/s)": metrics["http_reqs"]["values"]["rate"],
                "p50": duration["med"],
                "p90": duration["p(90)"],
                "p95": duration["p(95)"],
            })
    return pd.DataFrame(rows)


def write_markdown(data, path):
    table = data.copy()
    table["http_reqs (req/s)"] = table["http_reqs (req/s)"].map(lambda value: f"{value:.6f}")
    for column in ("p50", "p90", "p95"):
        table[column] = table[column].map(lambda value: f"{value:.2f}ms")
    path.write_text(
        table.to_markdown(index=False)
    )


def write_svg(data, path):
    versions = sorted(data["Version"].unique(), key=version_key)
    data = data.assign(_version=pd.Categorical(data["Version"], versions, ordered=True))
    data = data.sort_values(["_version", "VUs"])
    panels = [
        ("http_reqs (requests/second)", "http_reqs (req/s)"),
        ("p50 latency", "p50"),
        ("p90 latency", "p90"),
        ("p95 latency", "p95"),
    ]
    colors = {10: "tab:blue", 50: "tab:orange", 100: "tab:green"}
    figure, axes = plt.subplots(4, 1, figsize=(18, 15), sharex=True)
    for axis, (title, column) in zip(axes, panels):
        for vus, group in data.groupby("VUs", sort=True):
            axis.plot(group["_version"].astype(str), group[column], marker="o", label=f"{vus} VUs", color=colors.get(vus))
        axis.set_title(title)
        axis.grid(axis="y", color="lightgray")
        axis.legend(loc="best")
    axes[-1].tick_params(axis="x", rotation=60)
    figure.tight_layout()
    figure.savefig(path, format="svg")
    plt.close(figure)


def main():
    parser = argparse.ArgumentParser(description="Generate reports from k6 JSONL summaries")
    parser.add_argument("input", type=Path, help="Input JSONL file")
    args = parser.parse_args()
    data = read_results(args.input)
    if data.empty:
        raise SystemExit("empty input")
    RESULTS_DIR.mkdir(exist_ok=True)
    write_svg(data, RESULTS_DIR / f"{args.input.stem}.svg")
    write_markdown(data, RESULTS_DIR / f"{args.input.stem}.md")


if __name__ == "__main__":
    main()
