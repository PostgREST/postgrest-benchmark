# Runs PostgreSQL, PostgREST and k6 on this machine, each pinned to cores of
# its own, so that they don't take each other's, and prints a k6 summary per
# run, with what PostgreSQL and PostgREST used on their cores while it ran.
#
# Nix sets TUNING and POOLS, the deployment's settings as JSON, and SAMPLE_DB.

if [ "$#" -lt 3 ]; then
  echo "usage: postgrest-bench-local VUS[,VUS...] DURATION SCRIPT..." >&2
  exit 1
fi

vus_list=$1
duration=$2
shift 2

bin=${PGRSTBENCH_PGRST_VER:-}
if [ ! -x "$bin" ]; then
  echo "PGRSTBENCH_PGRST_VER must be the path of a PostgREST binary that runs on this machine" >&2
  exit 1
fi
cores=${PGRSTBENCH_LOCAL_PGRST_CORES:-2}
first_cpu=${PGRSTBENCH_LOCAL_PGRST_FIRST_CPU:-32}
pgrst_cpus="$first_cpu-$((first_cpu + cores - 1))"
pg_cpus=${PGRSTBENCH_LOCAL_PG_CPUS:-8-31}
k6_cpus=${PGRSTBENCH_LOCAL_K6_CPUS:-40-63}
warmup=${PGRSTBENCH_LOCAL_WARMUP:-10s}
port=${PGRSTBENCH_LOCAL_PORT:-3000}
db_instance=${PGRSTBENCH_EC2_DB_INSTANCE_TYPE:-m5a.8xlarge}

# The pool the deployment gives an m5a instance with as many cores: it has two
# vCPUs, threads of one core, per core
if [ -n "${PGRSTBENCH_LOCAL_POOL:-}" ]; then
  pool=$PGRSTBENCH_LOCAL_POOL
else
  case $cores in
    1) pgrst_instance=m5a.large ;;
    2) pgrst_instance=m5a.xlarge ;;
    4) pgrst_instance=m5a.2xlarge ;;
    8) pgrst_instance=m5a.4xlarge ;;
    16) pgrst_instance=m5a.8xlarge ;;
    *) echo "no pool size for $cores cores, set PGRSTBENCH_LOCAL_POOL" >&2; exit 1 ;;
  esac
  pool=$(jq -r --arg instance "$pgrst_instance" '.[$instance]' "$POOLS")
fi

# The CPUs of a list like 8-23,30
expand_cpus() {
  local range
  for range in ${1//,/ }; do
    seq "${range%-*}" "${range#*-}"
  done
}
pg_cpu_list=$(expand_cpus "$pg_cpus")
pgrst_cpu_list=$(expand_cpus "$pgrst_cpus")

# Milliseconds the CPUs of a list spent busy since boot
busy_ms() {
  local hz
  hz=$(getconf CLK_TCK)
  awk -v cpus=" $(echo "$1" | tr '\n' ' ')" -v hz="$hz" '
    $1 ~ /^cpu[0-9]+$/ && index(cpus, " " substr($1, 4) " ") {
      busy += $2 + $3 + $4 + $7 + $8 + $9
    }
    END { printf "%d\n", busy * 1000 / hz }' /proc/stat
}

tmp=$(mktemp -d /tmp/pgrstbench.XXXXXX)
pgrst_pid=
cleanup() {
  if [ -n "$pgrst_pid" ]; then
    kill -INT "$pgrst_pid" 2> /dev/null || true
    wait "$pgrst_pid" 2> /dev/null || true
  fi
  pg_ctl -D "$tmp/db" -m immediate stop > /dev/null 2>&1 || true
  rm -rf "$tmp"
}
trap cleanup EXIT

echo "Starting PostgreSQL on CPUs $pg_cpus, with the settings of an $db_instance" >&2
initdb -D "$tmp/db" -U postgres --auth=trust > /dev/null
jq -r --arg instance "$db_instance" '.[$instance] | to_entries[] | "\(.key) = '\''\(.value)'\''"' "$TUNING" \
  >> "$tmp/db/postgresql.conf"
taskset -c "$pg_cpus" pg_ctl -D "$tmp/db" -l "$tmp/db.log" -w \
  -o "-c listen_addresses='' -k $tmp" start > /dev/null
psql -h "$tmp" -U postgres -q -v ON_ERROR_STOP=1 -f "$SAMPLE_DB" > /dev/null 2> "$tmp/sample-db.log"

echo "Starting PostgREST on CPUs $pgrst_cpus, with a pool of $pool: $bin" >&2
{
  echo "db-uri = \"postgres://postgres@/postgres?host=$tmp\""
  echo 'db-schemas = "public"'
  echo 'db-anon-role = "postgres"'
  echo "db-pool = $pool"
  echo 'server-host = "127.0.0.1"'
  echo "server-port = $port"
  echo "admin-server-port = $((port + 1))"
  echo 'jwt-secret = "reallyreallyreallyreallyverysafe"'
  if [ "${PGRSTBENCH_JWT_CACHE_ENABLED:-}" != true ]; then
    echo 'jwt-cache-max-entries = 0'
  fi
  echo "${PGRSTBENCH_PGRST_EXTRA_CONFIG:-}"
} > "$tmp/pgrst.conf"
# shellcheck disable=SC2086 # the RTS options are words
taskset -c "$pgrst_cpus" "$bin" "$tmp/pgrst.conf" +RTS -N"$cores" ${PGRSTBENCH_GHC_RTS:-} -RTS \
  > "$tmp/pgrst.log" 2>&1 &
pgrst_pid=$!
for _ in $(seq 1 120); do
  if curl -sf -o /dev/null "http://127.0.0.1:$((port + 1))/ready"; then
    break
  fi
  if ! kill -0 "$pgrst_pid" 2> /dev/null; then
    cat "$tmp/pgrst.log" >&2
    exit 1
  fi
  sleep 0.5
done

perf_events=
if perf stat -a -C "$pgrst_cpus" -e instructions -x, -o /dev/null true > /dev/null 2>&1; then
  perf_events=instructions
else
  echo "perf can't count instructions per CPU; the summaries leave them out" >&2
fi

# Writes the k6 script for VUS, DURATION and the scripts, and prints the
# options k6 needs besides
write_script() {
  local vus=$1 duration=$2
  shift 2
  if [ "${PGRSTBENCH_K6_MIXED:-}" = true ]; then
    python3 scripts/mixed_script.py --vus "$vus" --duration "$duration" \
      ${PGRSTBENCH_K6_RATE:+--rate "$PGRSTBENCH_K6_RATE"} "$@" > "$tmp/script.js"
  else
    cat k6/private/utils.js "$1" > "$tmp/script.js"
    echo "--vus $vus --duration $duration"
  fi
}

# The k6 command for a run labelled LABEL, with the options
k6_command() {
  local label=$1
  shift
  k6_cmd=(taskset -c "$k6_cpus" k6 run -q
    --env PGRSTBENCH_URL="http://127.0.0.1:$port"
    --env K6_SCRIPT="$label"
    --env POSTGREST_VERSION="$bin"
    --env PGRSTBENCH_GHC_RTS="${PGRSTBENCH_GHC_RTS:-}"
    --env PGRSTBENCH_PGRST_EXTRA_CONFIG="${PGRSTBENCH_PGRST_EXTRA_CONFIG:-}"
    "$@" "$tmp/script.js")
}

scripts=("$@")
mixed=
if [ "${PGRSTBENCH_K6_MIXED:-}" = true ]; then
  mixed=1
fi
# one run per VUs, of every script, or of all at once
runs=()
for vus in ${vus_list//,/ }; do
  if [ -n "$mixed" ]; then
    runs+=("$vus mixed")
  else
    for script in "${scripts[@]}"; do
      runs+=("$vus $script")
    done
  fi
done

warmed=
for run in "${runs[@]}"; do
  vus=${run%% *}
  script=${run#* }
  if [ -n "$mixed" ]; then
    run_scripts=("${scripts[@]}")
  else
    run_scripts=("$script")
  fi
  if [ -z "$warmed" ]; then
    echo "Warming up for $warmup" >&2
    read -ra options <<< "$(write_script "$vus" "$warmup" "${run_scripts[@]}")"
    k6_command warmup "${options[@]}"
    "${k6_cmd[@]}" > /dev/null
    warmed=1
  fi
  echo "Running k6 with $vus VUs for $duration: $script" >&2
  read -ra options <<< "$(write_script "$vus" "$duration" "${run_scripts[@]}")"
  k6_command "$script" "${options[@]}"
  pg_before=$(busy_ms "$pg_cpu_list")
  pgrst_before=$(busy_ms "$pgrst_cpu_list")
  if [ -n "$perf_events" ]; then
    summary=$(perf stat -a -A -C "$pg_cpus,$pgrst_cpus" -e "$perf_events" -x, -o "$tmp/perf" -- "${k6_cmd[@]}")
  else
    summary=$("${k6_cmd[@]}")
  fi
  pg_ms=$(( $(busy_ms "$pg_cpu_list") - pg_before ))
  pgrst_ms=$(( $(busy_ms "$pgrst_cpu_list") - pgrst_before ))
  instructions=null
  if [ -n "$perf_events" ]; then
    instructions=$(awk -F, -v pg=" $(echo "$pg_cpu_list" | tr '\n' ' ')" '
      /^CPU/ { cpu = substr($1, 4) + 0; if (index(pg, " " cpu " ")) g += $2; else p += $2 }
      END { printf "{\"pg\": %d, \"pgrst\": %d}\n", g, p }' "$tmp/perf")
  fi
  peak_rss_kb=$(awk '/VmHWM/ { print $2 }' "/proc/$pgrst_pid/status")
  jq -c \
    --arg name "${PGRSTBENCH_LOCAL_NAME:-}" --arg round "${PGRSTBENCH_LOCAL_ROUND:-}" \
    --arg pg_cpus "$pg_cpus" --arg pgrst_cpus "$pgrst_cpus" --arg k6_cpus "$k6_cpus" \
    --argjson cores "$cores" --argjson pool "$pool" --argjson vus "$vus" --arg duration "$duration" \
    --arg db_instance "$db_instance" \
    --argjson pg_ms "$pg_ms" --argjson pgrst_ms "$pgrst_ms" --argjson instructions "$instructions" \
    --argjson peak_rss_kb "$peak_rss_kb" \
    '. + {PGRSTBENCH_LOCAL: {
       name: $name, round: $round, cores: $cores, pool: $pool, vus: $vus, duration: $duration,
       db_instance: $db_instance, cpus: {pg: $pg_cpus, pgrst: $pgrst_cpus, k6: $k6_cpus},
       pg: {cpu_ms: $pg_ms, instructions: $instructions.pg},
       pgrst: {cpu_ms: $pgrst_ms, instructions: $instructions.pgrst, peak_rss_kb: $peak_rss_kb}}}' \
    <<< "$summary"
done
