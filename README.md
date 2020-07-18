# PostgREST benchmark

The goal of this repo is to provide a "reproducible benchmark" for PostgREST by using Nix/NixOps.
Run a nix command, wait and get a report of the results.

## Motivation

The [performance section of PostgREST](https://github.com/PostgREST/postgrest#performance) is heavily outdated.

There are recent reports about a drop in performance:

- [Only 1200 req/s instead of the old 2000 req/s](https://gitter.im/begriffs/postgrest?at=5ef91afa54d7862dc4b4ae2d)
- [10-15% drop in perf with pre-request](https://gitter.im/begriffs/postgrest?at=5f075bb9a9378637e8ba5f9b)
- [Slow insertions](https://gitter.im/begriffs/postgrest?at=5f0c2f38f6b7416284300cb0)(might be solved by specifying columns)

## Ideas on the implementation

- We'll use AWS since it's better supported on NixOps.
- What instace to pick for testing PostgREST?
  - https://aws.amazon.com/ec2/instance-types/
  - Since the cheap T2 instances can't use their max CPU all the time, we should pick the [Computed Optimized](https://aws.amazon.com/ec2/instance-types/#Compute_Optimized) instances(C5 maybe).
  - It would cost some $$, could be mentioned upfront.
- Network
  - Should we use a separate machine(s) to make the requests? This would make the benchmark more realistic.
  - Maybe we can set a VPC with a t2.micro as client. This would also make latency negligible for the benchmark.
- Scenarios to test:
  - read heavy workload(with resource embedding)
  - write heavy workload(with and without [specifying-columns](http://postgrest.org/en/v7.0.0/api.html#specifying-columns))
  - pg + pgrest on the same machine(unix socket and tcp).
  - pg and pgrest on different machines?
  - pgrest with `pre-request`?
- What db template to use?
  - Chinook: https://github.com/lerocha/chinook-database
  - Also used by Hasura on https://github.com/hasura/graphql-backend-benchmarks
