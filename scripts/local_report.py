"""Reports the summaries of postgrest-bench-local runs as markdown tables.

Runs with the same script, VUs, rate, cores and PostgREST settings are compared
across binaries. Each cell is the median over the rounds, with the range in
brackets when there's more than one. The first binary in the input is the
baseline that the others are compared to.
"""

import argparse
import json
import statistics
from collections import defaultdict
from pathlib import Path


def summary_metrics(metrics, suffix=""):
    """Requests per second, latencies in ms and failures in % of the requests
    tagged with the suffix, or of all"""
    requests = metrics.get("http_reqs" + suffix, {}).get("values", {})
    duration = metrics.get("http_req_duration" + suffix, {}).get("values", {})
    failed = metrics.get("http_req_failed" + suffix, {}).get("values", {})
    return {
        "req/s": requests.get("rate"),
        "p50 ms": duration.get("med"),
        "p95 ms": duration.get("p(95)"),
        "p99 ms": duration.get("p(99)"),
        "failed %": failed["rate"] * 100 if "rate" in failed else None,
    }


def cpu_count(cpus):
    """The number of CPUs in a list like 8-23,30"""
    return sum(int(r.split("-")[-1]) - int(r.split("-")[0]) + 1 for r in cpus.split(","))


def read(paths):
    runs = []
    for path in paths:
        for line in path.read_text().splitlines():
            if not line.strip():
                continue
            record = json.loads(line)
            local = record.get("PGRSTBENCH_LOCAL")
            if not local:
                continue
            mixed = record.get("PGRSTBENCH_MIXED") or {}
            metrics = record["metrics"]
            count = metrics["http_reqs"]["values"]["count"]
            total = summary_metrics(metrics)
            total["dropped iterations"] = metrics.get("dropped_iterations", {}).get("values", {}).get("count", 0)
            total["PostgREST CPU µs/req"] = local["pgrst"]["cpu_ms"] * 1000 / count
            total["PostgreSQL CPU µs/req"] = local["pg"]["cpu_ms"] * 1000 / count
            total["PostgreSQL busy, % of its CPUs"] = (
                local["pg"]["cpu_ms"] / record["state"]["testRunDurationMs"] / cpu_count(local["cpus"]["pg"]) * 100)
            for side, label in (("pgrst", "PostgREST"), ("pg", "PostgreSQL")):
                instructions = local[side].get("instructions")
                total[f"{label} kinstructions/req"] = instructions / count / 1000 if instructions else None
            total["PostgREST peak RSS MB"] = local["pgrst"]["peak_rss_kb"] / 1024
            scenarios = {name: summary_metrics(metrics, f"{{scenario:{name}}}") for name in mixed.get("scenarios", [])}
            runs.append({
                "binary": local.get("name") or Path(record.get("POSTGREST_VERSION") or "?").name,
                "config": (record.get("K6_SCRIPT"), mixed.get("rate"), local["vus"], local["cores"],
                           record.get("PGRSTBENCH_GHC_RTS") or "", record.get("PGRSTBENCH_PGRST_EXTRA_CONFIG") or ""),
                "total": total,
                "scenarios": scenarios,
            })
    return runs


def cell(values):
    values = [value for value in values if value is not None]
    if not values:
        return "–", None
    median = statistics.median(values)
    big = max(abs(value) for value in values) >= 100
    form = (lambda value: f"{value:,.0f}") if big else (lambda value: f"{value:.2f}")
    if len(values) == 1 or min(values) == max(values):
        return form(median), median
    return f"{form(median)} ({form(min(values))}–{form(max(values))})", median


def ratio(value, baseline):
    if value is None or not baseline:
        return "–"
    return f"{value / baseline:.2f}×"


def label(config):
    script, rate, vus, cores, rts, extra = config
    parts = [script or "?", f"{cores} PostgREST core{'' if cores == 1 else 's'}", f"{vus} VUs"]
    if rate:
        parts.append(f"{rate} iterations/s")
    if rts:
        parts.append(f"RTS {rts}")
    if extra:
        parts.append(extra.strip().replace("\n", "; "))
    return ", ".join(parts)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("results", nargs="+", type=Path)
    runs = read(parser.parse_args().results)
    binaries = list(dict.fromkeys(run["binary"] for run in runs))
    baseline, others = binaries[0], binaries[1:]
    groups = defaultdict(lambda: defaultdict(list))
    for run in runs:
        groups[run["config"]][run["binary"]].append(run)

    def order(config):
        script, rate, vus, cores, rts, extra = config
        return (script or "", rate or 0, rts, extra, vus, cores)

    out = []
    for config in sorted(groups, key=order):
        by_binary = groups[config]
        rounds = max(len(runs) for runs in by_binary.values())
        out += [f"## {label(config)}", "", f"{rounds} round{'' if rounds == 1 else 's'}.", ""]
        present = [binary for binary in binaries if binary in by_binary]
        out.append("| | " + " | ".join(present) + "".join(f" | {other} / {baseline}" for other in others if other in by_binary) + " |")
        out.append("|---" * (1 + len(present) + len([o for o in others if o in by_binary])) + "|")
        for metric in runs[0]["total"]:
            cells = {binary: cell([run["total"][metric] for run in by_binary[binary]]) for binary in present}
            row = [cells[binary][0] for binary in present]
            row += [ratio(cells[other][1], cells.get(baseline, (None, None))[1]) for other in others if other in by_binary]
            out.append(f"| {metric} | " + " | ".join(row) + " |")
        scenarios = list(dict.fromkeys(name for runs in by_binary.values() for run in runs for name in run["scenarios"]))
        if scenarios:
            out += ["", "Per scenario, requests per second and p95 latency in ms:", ""]
            header = [f"{binary} req/s" for binary in present] + [f"{o} / {baseline}" for o in others if o in by_binary]
            header += [f"{binary} p95" for binary in present] + [f"{o} / {baseline}" for o in others if o in by_binary]
            out.append("| scenario | " + " | ".join(header) + " |")
            out.append("|---" * (1 + len(header)) + "|")
            for name in scenarios:
                row = []
                for metric in ("req/s", "p95 ms"):
                    cells = {binary: cell([run["scenarios"].get(name, {}).get(metric) for run in by_binary[binary]])
                             for binary in present}
                    row += [cells[binary][0] for binary in present]
                    row += [ratio(cells[other][1], cells.get(baseline, (None, None))[1]) for other in others if other in by_binary]
                out.append(f"| {name} | " + " | ".join(row) + " |")
        out.append("")

    # how the requests per second grow with PostgREST's cores
    series = defaultdict(dict)
    for config, by_binary in groups.items():
        script, rate, vus, cores, rts, extra = config
        for binary, binary_runs in by_binary.items():
            series[(script, rate, vus, rts, extra)].setdefault(binary, {})[cores] = \
                statistics.median(run["total"]["req/s"] for run in binary_runs)
    scaling = {key: value for key, value in series.items() if len({c for b in value.values() for c in b}) > 1}
    if scaling:
        out += ["## Requests per second by PostgREST cores", ""]
        for key in sorted(scaling, key=lambda key: (key[0] or "", key[1] or 0, key[3], key[4], key[2])):
            script, rate, vus, rts, extra = key
            by_binary = scaling[key]
            cores = sorted({c for values in by_binary.values() for c in values})
            out += [f"{label((script, rate, vus, 0, rts, extra)).replace('0 PostgREST cores, ', '')}:", ""]
            out.append("| | " + " | ".join(f"{c} core{'' if c == 1 else 's'}" for c in cores) + " |")
            out.append("|---" * (1 + len(cores)) + "|")
            for binary in [b for b in binaries if b in by_binary]:
                out.append(f"| {binary} | " + " | ".join(
                    f"{by_binary[binary][c]:,.0f}" if c in by_binary[binary] else "–" for c in cores) + " |")
            for other in [o for o in others if o in by_binary and baseline in by_binary]:
                out.append(f"| {other} / {baseline} | " + " | ".join(
                    ratio(by_binary[other].get(c), by_binary[baseline].get(c)) for c in cores) + " |")
            out.append("")
    print("\n".join(out))


if __name__ == "__main__":
    main()
