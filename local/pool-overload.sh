# Reproduces PostgREST/postgrest#5336: when more requests are in flight than
# db-pool has connections, the requests that wait for a connection cost CPU,
# and more PostgREST cores make it worse.
#
# Runs one machine's benchmark (postgrest-bench-local) of a single-row GET with
# a JWT from a pool of tokens, 80% of which the JWT cache holds, 100 VUs for 10s
# after a warm-up of 5s, with:
# - PostgreSQL on 2 CPUs, so that connections are held long enough for requests
#   to queue for them, and PostgREST on 2, 4, 8 and 16 cores with db-pool = 20;
# - PostgreSQL on 1 CPU and PostgREST on 4 cores, with db-pool = 20, so that
#   80 requests wait, and with db-pool = 200, so that none waits.
#
# The CPUs default to the layout of a 64 CPU machine, see postgrest-bench-local.

if [ "$#" -lt 1 ]; then
  echo "usage: postgrest-bench-pool-overload POSTGREST_BINARY [RESULTS_FILE]" >&2
  exit 1
fi

bin=$(realpath -e -- "$1")
results=${2:-results/pool-overload.jsonl}
vus=${PGRSTBENCH_OVERLOAD_VUS:-100}
duration=${PGRSTBENCH_OVERLOAD_DURATION:-10s}
tokens=${PGRSTBENCH_OVERLOAD_TOKENS:-10000}
# the JWT cache holds 80% of the pool, so that about 80% of the requests hit it
cache=${PGRSTBENCH_OVERLOAD_CACHE:-$((tokens * 8 / 10))}
cores_list=${PGRSTBENCH_OVERLOAD_CORES:-2 4 8 16}
pg_cpus=${PGRSTBENCH_LOCAL_PG_CPUS:-8-9}

mkdir -p "$(dirname "$results")"
: > "$results"

export PGRSTBENCH_PGRST_VER=$bin
export PGRSTBENCH_JWT_CACHE_ENABLED=true
export PGRSTBENCH_JWT_POOL_SIZE=$tokens
export PGRSTBENCH_LOCAL_WARMUP=${PGRSTBENCH_LOCAL_WARMUP:-5s}
# the CPUs PostgREST has up to 16 cores of, then k6's
export PGRSTBENCH_LOCAL_K6_CPUS=${PGRSTBENCH_LOCAL_K6_CPUS:-48-63}

# NAME, PostgreSQL's CPUs, PostgREST's cores and its pool
run() {
  echo "== $1: PostgreSQL on CPUs $2, PostgREST on $3 cores, db-pool = $4" >&2
  # the comment tells the runs on other CPUs apart in the report
  PGRSTBENCH_PGRST_EXTRA_CONFIG="jwt-cache-max-entries = $cache"$'\n'"# PostgreSQL on CPUs $2" \
  PGRSTBENCH_LOCAL_NAME=$1 PGRSTBENCH_LOCAL_PG_CPUS=$2 \
  PGRSTBENCH_LOCAL_PGRST_CORES=$3 PGRSTBENCH_LOCAL_POOL=$4 \
    postgrest-bench-local "$vus" "$duration" k6/GETSingleJWTCached.js >> "$results"
}

for cores in $cores_list; do
  run pool-20 "$pg_cpus" "$cores" 20
done
# PostgreSQL's first CPU
one_cpu=${pg_cpus%%[-,]*}
run pool-20 "$one_cpu" 4 20
run pool-200 "$one_cpu" 4 200

echo "Summaries in $results" >&2
postgrest-bench-local-report "$results"
