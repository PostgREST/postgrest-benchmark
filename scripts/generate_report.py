import argparse
import json
import re
import sys
from pathlib import Path

import matplotlib
import pandas as pd

matplotlib.use("Agg")
import matplotlib.pyplot as plt


def version_key(version):
    return tuple(int(part) for part in re.findall(r"\d+", version))


def read_results():
    rows = []
    for line in sys.stdin:
        if not line.strip():
            continue
        record = json.loads(line)
        metrics = record["metrics"]
        duration = metrics["http_req_duration"]["values"]
        rows.append({
            "Version": record.get("POSTGREST_VERSION"),
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
    parser.add_argument("--svg", type=Path, default=Path("results/report.svg"))
    parser.add_argument("--markdown", type=Path, default=Path("results/report.md"))
    args = parser.parse_args()
    data = read_results()
    if data.empty:
        raise SystemExit("empty input")
    write_svg(data, args.svg)
    write_markdown(data, args.markdown)


if __name__ == "__main__":
    main()
