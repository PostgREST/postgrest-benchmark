"""Writes one k6 script that runs the given k6 scripts at once, each as a
scenario of its own.

k6 tags every request with its scenario. A threshold on each scenario's
metrics, which always passes, makes the summary hold them, so a run gives
every scenario's requests, latencies and failures, and the totals of the mix.

The scripts stay as they are: each one's body is wrapped in a function, so
their names don't clash, and their imports are merged.
"""

import argparse
import json
import re
import sys
from pathlib import Path

UTILS = Path(__file__).resolve().parent.parent / "k6" / "private" / "utils.js"

IMPORT = re.compile(r"^import\s+(.+?)\s+from\s+['\"]([^'\"]+)['\"];?[ \t]*\n?", re.M)
DEFAULT_EXPORT = re.compile(r"export\s+default\s+function\b")
TEARDOWN_EXPORT = re.compile(r"^export\s*\{\s*(\w+)\s+as\s+teardown\s*\};?[ \t]*\n?", re.M)
OPTIONS_EXPORT = re.compile(r"^export\s+const\s+options\s*=\s*\{", re.M)
UTILS_EXPORT = re.compile(r"^export\s*\{\s*handleSummary\s*\};?[ \t]*\n?", re.M)


def without_imports(source, imports):
    """The source without its imports, which are added to `imports`: module ->
    [default name, named imports]."""
    for clause, module in IMPORT.findall(source):
        default, named = imports.setdefault(module, [None, set()])
        braces = re.search(r"\{([^}]*)\}", clause)
        if braces:
            named.update(name.strip() for name in braces.group(1).split(",") if name.strip())
        name = re.sub(r"\{[^}]*\}", "", clause).strip(" ,")
        if name:
            if default not in (None, name):
                sys.exit(f"{module} is imported as both {default} and {name}")
            imports[module][0] = name
    return IMPORT.sub("", source)


def without_options(source):
    """The source without its options, whose thresholds would apply to the
    whole mix."""
    match = OPTIONS_EXPORT.search(source)
    if not match:
        return source
    depth, end = 0, match.end() - 1
    for end in range(match.end() - 1, len(source)):
        depth += {"{": 1, "}": -1}.get(source[end], 0)
        if depth == 0:
            break
    rest = source[end + 1:]
    return source[:match.start()] + rest[1:] if rest.startswith(";") else source[:match.start()] + rest


def scenario(path, imports, teardowns):
    """The script as a function that runs one iteration of it."""
    source = without_options(without_imports(path.read_text(), imports))
    teardowns.update(TEARDOWN_EXPORT.findall(source))
    source = TEARDOWN_EXPORT.sub("", source)
    if not DEFAULT_EXPORT.search(source):
        sys.exit(f"{path} has no default function")
    source = DEFAULT_EXPORT.sub("const iteration = function", source)
    if re.search(r"^\s*export\b", source, re.M):
        sys.exit(f"{path} exports something besides its default function and teardown")
    body = "\n".join("  " + line if line else line for line in source.strip().splitlines())
    return f"(() => {{\n{body}\n  return iteration;\n}})()"


def split(total, parts):
    """`total` split into `parts` near-equal shares, each at least 1."""
    return [max(1, total // parts + (1 if index < total % parts else 0)) for index in range(parts)]


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--vus", type=int, required=True,
                        help="virtual users in all, split among the scenarios, at least one each")
    parser.add_argument("--duration", required=True, help="how long the scenarios run, e.g. 30s")
    parser.add_argument("--rate", type=int,
                        help="iterations per second in all, split evenly among the scenarios: "
                             "each scenario runs at a constant rate, with its share of --vus, "
                             "instead of with its virtual users as fast as they can")
    parser.add_argument("scripts", nargs="+", type=Path)
    arguments = parser.parse_args()

    imports, teardowns = {}, set()
    names = [re.sub(r"\W", "_", path.stem) for path in arguments.scripts]
    if len(set(names)) != len(names):
        sys.exit("two scripts have the same name")
    scenarios = [scenario(path, imports, teardowns) for path in arguments.scripts]
    utils = UTILS_EXPORT.sub("", without_imports(UTILS.read_text(), imports))

    options = {"scenarios": {}, "thresholds": {}, "summaryTrendStats": ["avg", "min", "med", "max", "p(90)", "p(95)", "p(99)"]}
    for name, vus in zip(names, split(arguments.vus, len(names))):
        if arguments.rate:
            # a rate over as many seconds as there are scenarios splits it
            # exactly, without a fraction of an iteration per second
            options["scenarios"][name] = {
                "executor": "constant-arrival-rate", "exec": name, "duration": arguments.duration,
                "rate": arguments.rate, "timeUnit": f"{len(names)}s",
                "preAllocatedVUs": vus, "maxVUs": vus,
            }
        else:
            options["scenarios"][name] = {"executor": "constant-vus", "exec": name, "vus": vus, "duration": arguments.duration}
        for metric, threshold in (("http_reqs", "count>=0"), ("http_req_duration", "max>=0"),
                                  ("http_req_failed", "rate>=0"), ("iterations", "count>=0")):
            options["thresholds"][f"{metric}{{scenario:{name}}}"] = [threshold]
    if arguments.rate:
        options["thresholds"]["dropped_iterations"] = ["count>=0"]

    mixed = {"scenarios": names, "vus": arguments.vus, "duration": arguments.duration, "rate": arguments.rate}
    out = []
    for module, (default, named) in sorted(imports.items()):
        clause = ", ".join(filter(None, [default, "{ " + ", ".join(sorted(named)) + " }" if named else None]))
        out.append(f"import {clause} from '{module}';")
    out += ["", utils.strip(), ""]
    for name, wrapped in zip(names, scenarios):
        out += [f"// {name}", f"export const {name} = {wrapped};", ""]
    out.append(f"export const options = {json.dumps(options, indent=2)};")
    out += ["", f"const mixed = {json.dumps(mixed)};", "",
            "function mixedSummary(data) {",
            "  data.PGRSTBENCH_MIXED = mixed;",
            "  return handleSummary(data);",
            "}",
            "",
            "export { mixedSummary as handleSummary };"]
    if teardowns:
        out += ["", "export function teardown() {"] + [f"  {name}();" for name in sorted(teardowns)] + ["}"]
    print("\n".join(out))


if __name__ == "__main__":
    main()
