# PostgREST Benchmark

Reproducible benchmark for PostgREST by using [Nix](https://nixos.org/) and [NixOps](https://github.com/NixOS/nixops).

NixOps provisions AWS EC2 instances on a dedicated VPC and deploys the different components for load testing.

The default setup includes:

- A `m5a.xlarge` instance which uses [k6](https://k6.io/) for load testing.
- A `t3a.nano` instance with PostgreSQL.
- A `t3a.nano` instance with PostgREST + Nginx.

This setup, including the size of the EC2 instances, can be modified with environment variables. As the PostgreSQL server instance size increases, its settings are modified according to [PGTune](https://pgtune.leopard.in.ua/) recommendations.

## Requirements

- [AWS](https://aws.amazon.com) account with an `~/.aws/credentials` file in place (can be created with `aws-cli`). The "default" profile is picked up by default but you can change it by doing:
  ```
  export PGRSTBENCH_AWS_PROFILE="another_profile"
  ```

- [Nix](https://nixos.org/).

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
$ postgrest-bench-k6 20 k6/GETSingle.js
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
$ pgrbench-k6 10 k6/GETSingle.js

## You will see the k6 logo and runs here
```

There are different scripts on `k6/` which test different PostgREST requests.

## Pgbench

pgbench also runs on the client instance, you can get its output with:

```
$ postgrest-bench-pgbench pgbench/GETSingle.sql
```

The `GETSingle.sql` runs an equivalent SQL statement to what PostgREST generates for `GETSingle.js`. The motivation for this comparison is to see how much PostgREST performance differs from direct SQL connections.

## Varying Scripts

There are scripts that help with varying the environment while load testing. You can use these to get a report once the command finishes running:

Run pgbench with a different qty of clients:

```
$ postgrest-bench-pgbench-vary-clients pgbench/GETSingle.sql
```

Run k6 with a different qty of VUs:

```
$ postgrest-bench-k6-vary-vus k6/GETSingle.js
```

Run pgbench with varied clients and with varied pg instances (this will involve reprovisioning/redeploying the pg instance, it will take a while):

```
$ postgrest-bench-vary-pg postgrest-bench-pgbench-vary-clients pgbench/GETSingle.sql > PGBENCH_GET_SINGLE.txt
```

Run k6 with varied vus and with varied pg instances and pgrst instances (this will involve reprovisioning/redeploying the pg and pgrst instance, it will take even longer):

```
$ postgrest-bench-vary-pg-pgrst postgrest-bench-k6-vary-vus k6/GETSingle.js > K6_GET_SINGLE.txt
```

## Different Setups

### Nginx included (default)

To load test with nginx included do:

```bash
export PGRBENCH_WITH_NGINX="true"
postgrest-bench-deploy
```

To only have PostgREST listening directly on port 80:

```bash
export PGRBENCH_WITH_NGINX="false"
postgrest-bench-deploy
```

### Unix socket (default)

To load test connecting pgrest to pg with unix socket, and pgrest to nginx with unix socket.

```bash
export PGRBENCH_WITH_UNIX_SOCKET="true"
postgrest-bench-deploy
```

To use tcp instead, you can do:

```bash
export PGRBENCH_WITH_UNIX_SOCKET="false"
postgrest-bench-deploy
```

### Separate PostgreSQL instance (default)

To load test with a pg on a different ec2 instance.

```bash
export PGRBENCH_SEPARATE_PG="true"
postgrest-bench-deploy
```

To use the same instance for both PostgreSQL and PostgREST.

```bash
export PGRBENCH_SEPARATE_PG="false"
postgrest-bench-deploy
```

### Two PostgREST instances over load balanced with Nginx

Some experiments indicate that when load testing on big instances (like `m5a.8xlarge` and above), having two postgrest instances instead of one increase throughput. You can try this with:

```bash
export PGRSTBENCH_PGRST_NGNIX_LBS="true"
postgrest-bench-deploy
```

### Different EC2 instance types

To change pg and PostgREST EC2 instance types(both `t3a.nano` by default):

```bash
export PGRBENCH_PG_INSTANCE_TYPE="t3a.xlarge"
export PGRBENCH_PGRST_INSTANCE_TYPE="t3a.xlarge"
export PGRBENCH_PGRST_INSTANCE_TYPE="t3a.xlarge"

postgrest-bench-deploy
```

## Limitations

- Uses an outdated version of NixOps, 1.7. Newer versions have changed considerably.
- Don't try changing to ARM-based instances, these don't work with the above NixOps version.
  + The instances tested for this benchmark are the `t3a` series and the `m5a` series.

## Other benchmarks

+ [majkinetor/postgrest-test](https://github.com/majkinetor/postgrest-test): PostgREST benchmark on Windows.
