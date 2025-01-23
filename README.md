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
$ postgrest-bench-k6 20 k6/GETSingle.js

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
export PGRSTBENCH_PG_INSTANCE_TYPE="t3a.xlarge"
export PGRSTBENCH_PGRST_INSTANCE_TYPE="t3a.xlarge"

postgrest-bench-deploy
```

## Limitations

- The instances tested for this benchmark are the `t3a` series and the `m5a` series.
  ARM-based instances, haven't been tested.

## Other benchmarks

+ [majkinetor/postgrest-test](https://github.com/majkinetor/postgrest-test): PostgREST benchmark on Windows.
