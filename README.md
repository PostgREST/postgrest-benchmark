# PostgREST benchmark(Work in progress)

The goal of this repo is to provide an updated and reproducible benchmark for PostgREST by using Nix and [k6](https://k6.io/).

## Motivation

The [performance section of PostgREST](https://github.com/PostgREST/postgrest#performance) is outdated.

There are recent reports about a drop in performance:

- [Only 1200 req/s instead of the old 2000 req/s](https://gitter.im/begriffs/postgrest?at=5ef91afa54d7862dc4b4ae2d)
- [10-15% drop in perf with pre-request](https://gitter.im/begriffs/postgrest?at=5f075bb9a9378637e8ba5f9b)
- [Slow insertions](https://gitter.im/begriffs/postgrest?at=5f0c2f38f6b7416284300cb0)(might be solved by specifying columns)

## Running

Run `nix-shell`. This will provide an environment where k6 and nixops are available.

Now create the test environment with nixops.

```bash
nixops create ./deploy.nix -d pgrst-bench

# This assumes there's a `~/.aws/credentials` file(created with aws-cli) with a default profile.
nixops deploy -d pgrst-bench

# to connect to the ec2 instance
# nixops ssh -d pgrst-bench t2nano
#
# you can inspect the db with
# psql -U postgres
# \d
```

And run the k6 script:

```
## k6 will run on the aws instance
nixops ssh -d pgrst-bench client k6 run -e HOST=t3anano - < k6/GETSingle.js

## or
## nixops ssh -d pgrst-bench client k6 run -e HOST=t2nano - < k6/GETSingle.js
```

## Ideas on the implementation

+ Scenarios to test:
  - read heavy workload(with resource embedding)
  - write heavy workload(with and without [specifying-columns](http://postgrest.org/en/v7.0.0/api.html#specifying-columns))
  - pg + pgrest on the same machine(unix socket and tcp).
  - pg and pgrest on different machines?
  - pgrest with `pre-request`?

+ What db template to use?
  - Chinook: https://github.com/lerocha/chinook-database. Pg version: https://github.com/xivSolutions/ChinookDb_Pg_Modified.
  - Also used by Hasura on https://github.com/hasura/graphql-backend-benchmarks

## Notes

+ [majkinetor/postgrest-test](https://github.com/majkinetor/postgrest-test): benchmark on Windows.
