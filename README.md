# PostgREST Benchmark

Reproducible benchmark for PostgREST by using [Nix](https://nixos.org/) and [NixOps](https://github.com/NixOS/nixops).

NixOps provisions AWS EC2 instances on a dedicated VPC and deploys the different components for load testing.

The default setup includes:

- A `m5a.8xlarge` PostgreSQL server instance. Tuned according to [PGTune](https://pgtune.leopard.in.ua/) recommendations.
- A `t3a.nano` client instance with PostgREST + Nginx. The size of this EC2 instance, can be modified with environment variables.
  + PostgREST pool size is tuned according to the EC2 instance size.
- A `t3a.nano` client instance with k6. The size of this EC2 instance, can be modified with environment variables.
- All networking is setup so the client instances can reach the server instance.

## Requirements

- [Nix](https://nixos.org/).

- [AWS](https://aws.amazon.com) account with an `~/.aws/credentials` file in place (can be created with `aws-cli`). The "default" profile is picked up by default but you can change it by doing:
  ```
  export PGRSTBENCH_AWS_PROFILE="another_profile"
  ```

## Quickstart

Run `nix-shell`. This will provide an environment where all the dependencies are available.

```
$ nix-shell
>
```

Deploy with:

```
$ postgrest-bench-deploy

pgrstBenchVpc.....> creating vpc under region us-east-2
..

pg................> activation finished successfully
pgrstbench> deployment finished successfully

# this command will take a couple minutes, it will deploy the client and server AWS machines VPC stuff
```

Run a `k6` test on the client instance and get the output:

```
$ postgrest-bench-k6 20 10s k6/GETSingle.js
```

Destroy all the setup and the AWS instances:

```
$ postgrest-bench-destroy
```

## SSH

To connect to the PostgreSQL instance:

```
$ postgrest-bench-ssh pg

# Check the installed services
$ systemctl list-units

## connect to postgres
$ psql -U postgres
$ \d
```

The postgresql server comes loaded with the [chinook database](https://github.com/xivSolutions/ChinookDb_Pg_Modified).

To connect to the PostgREST instance:

```
$ postgrest-bench-ssh pgrst

# Check the installed services
$ systemctl list-units

# Do a request
$ curl localhost:80/artist
```

You can also get info (like the IPs) of the instances with:

```
$ postgrest-bench-info
```

## K6

K6 runs on the client instance, but you can get the output of the load test on your machine:

```
## k6 will run with 10 VUs on the AWS client instance and load test the t3anano instance with the local k6/GETSingle.js script
$ postgrest-bench-k6 20 10s k6/GETSingle.js

Multiple scripts can be supplied; each script runs sequentially for the specified duration:

```
$ postgrest-bench-k6 20 10s k6/*
$ postgrest-bench-k6 20 10s k6/{GETSingle.js,GETSingleJWT.js}
```

## You will see the k6 logo and runs here
```

There are different scripts on `k6/` which test different PostgREST requests.

### All scripts at once

`postgrest-bench-k6-mixed` runs the scripts at the same time, each as a k6 scenario, splitting the VUs among them:

```
$ postgrest-bench-k6-mixed 100 30s k6/*.js
```

Every request is tagged with its scenario, so the summary has each scenario's requests, latencies and failures, as `http_reqs{scenario:GETSingle}`, `http_req_duration{scenario:GETSingle}` and so on, besides the totals of the mix.

By default every scenario's VUs send requests as fast as they can. To have each scenario run at a constant rate instead, set the total iterations per second, which are split evenly among the scenarios:

```
$ PGRSTBENCH_K6_RATE=2000 postgrest-bench-k6-mixed 100 30s k6/*.js
```

A scenario whose VUs can't keep up drops iterations, counted in `dropped_iterations`.

## Pgbench

pgbench also runs on the client instance, you can get its output with:

```
$ postgrest-bench-pgbench pgbench/GETSingle.sql
```

The `GETSingle.sql` runs an equivalent SQL statement to what PostgREST generates for `GETSingle.js`. The motivation for this comparison is to see how much PostgREST performance differs from direct SQL connections.

## Varying Scripts

There are scripts that help with varying the environment while load testing. You can use these to get a report once the command finishes running:

Run k6 with a different qty of VUs:

```
$ postgrest-bench-k6-vary k6/GETSingle.js
```

Run k6 with varied vus and with varied ec2 instances for the client and pgrst instances (this will involve reprovisioning/redeploying the client and pgrst instance, it will take a while):

```
$ postgrest-bench-vary-instances postgrest-bench-k6-vary k6/GETSingle.js > K6_GET_SINGLE.txt
```

## Different Setups

### Nginx included (default)

To load test with nginx included do:

```bash
export PGRSTBENCH_WITH_NGINX="true"
postgrest-bench-deploy
```

To only have PostgREST listening directly on port 80:

```bash
export PGRSTBENCH_WITH_NGINX="false"
postgrest-bench-deploy
```

### Unix socket (default)

To load test connecting pgrest to pg with unix socket, and pgrest to nginx with unix socket.

```bash
export PGRSTBENCH_WITH_UNIX_SOCKET="true"
postgrest-bench-deploy
```

To use tcp instead, you can do:

```bash
export PGRSTBENCH_WITH_UNIX_SOCKET="false"
postgrest-bench-deploy
```

### Separate PostgreSQL instance (default)

To load test with a pg on a different ec2 instance.

```bash
export PGRSTBENCH_SEPARATE_PG="true"
postgrest-bench-deploy
```

To use the same instance for both PostgreSQL and PostgREST.

```bash
export PGRSTBENCH_SEPARATE_PG="false"
postgrest-bench-deploy
```

### Different EC2 instance types

To change PostgreSQL and PostgREST EC2 instance types(both `t3a.nano` by default):

```bash
export PGRSTBENCH_EC2_DB_INSTANCE_TYPE="t3a.xlarge"
export PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE="t3a.xlarge"

postgrest-bench-deploy
```

### PostgREST version or custom binary

A stable PostgREST version (`v14.17`) is used by default. Set `PGRSTBENCH_PGRST_VER` to either a supported version or a custom binary path:

```
$ export PGRSTBENCH_PGRST_VER="v16.2"
$ postgrest-bench-deploy
```

For a development binary:

```
$ export PGRSTBENCH_PGRST_VER="your/bin/postgrest-new"
$ postgrest-bench-deploy
```

### Compare with a new PostgREST binary

You can use `postgrest-bench-pgrst-vs` to run a script using the current version vs another version or a binary.

```bash
# you can also add additional config to both
export PGRSTBENCH_PGRST_EXTRA_CONFIG='db-pipeline-mode = true'

postgrest-bench-pgrst-vs ./bin/pipeline-pgrst \
postgrest-bench-k6-vary-vus 1m k6/* \
> results/comparison.jsonl
```

## On one machine

To compare binaries closely, a single large Linux machine (e.g. a `c7g.metal`) keeps the noise of shared instances and the network out of the results. `postgrest-bench-local` runs PostgreSQL, PostgREST and k6 there, each pinned to CPUs of its own, with the deployment's settings: the database of an `m5a.8xlarge` (`PGRSTBENCH_EC2_DB_INSTANCE_TYPE`), with the sample database, and PostgREST with the pool of an m5a instance with as many cores. It starts both from scratch, warms up, and then runs k6 for each number of VUs:

```bash
export PGRSTBENCH_PGRST_VER=/path/to/postgrest
postgrest-bench-local 10,50,100 30s k6/*.js > results/local.jsonl

# or all scripts at once, as with postgrest-bench-k6-mixed
PGRSTBENCH_K6_MIXED=true postgrest-bench-local 10,50,100 30s k6/*.js
```

Each summary has, under `PGRSTBENCH_LOCAL`, the CPU time PostgreSQL and PostgREST used on their CPUs while k6 ran, the instructions they executed, if `perf` can count them, and PostgREST's peak RSS.

| Variable | Default | |
|---|---|---|
| `PGRSTBENCH_LOCAL_PGRST_CORES` | 2 | PostgREST's cores, and its `-N` |
| `PGRSTBENCH_LOCAL_PGRST_FIRST_CPU` | 32 | the first of PostgREST's CPUs |
| `PGRSTBENCH_LOCAL_PG_CPUS` | 8-31 | PostgreSQL's CPUs |
| `PGRSTBENCH_LOCAL_K6_CPUS` | 40-63 | k6's CPUs |
| `PGRSTBENCH_LOCAL_POOL` | by cores | PostgREST's pool |
| `PGRSTBENCH_LOCAL_WARMUP` | 10s | how long k6 runs first, unmeasured |
| `PGRSTBENCH_LOCAL_PORT` | 3000 | PostgREST's port, and the admin server's after it |

The defaults suit 64 CPUs: PostgreSQL needs about one and a half times PostgREST's cores, and k6 half. The other CPUs are left to the system. `PGRSTBENCH_GHC_RTS`, `PGRSTBENCH_PGRST_EXTRA_CONFIG` and `PGRSTBENCH_JWT_CACHE_ENABLED` apply as in the deployment.

## Limitations

- The instances tested for this benchmark are the `t3a` series and the `m5a` series.
  ARM-based instances, haven't been tested.

- When the NixOS AMI goes out out of date, you can get these errors:
  ```
  * client: list index out of range
  * pg: list index out of range
  * pgrst: list index out of range
  ```
  + To solve this run `postgrest-bench-generate-ami`

## Other benchmarks

+ [majkinetor/postgrest-test](https://github.com/majkinetor/postgrest-test): PostgREST benchmark on Windows.
