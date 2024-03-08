let
  nixpkgs = builtins.fetchTarball {
    name = "24.05";
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
    sha256 = "sha256:1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
  };
  pkgs = import nixpkgs {};
  global = import ./global.nix;
  prefix = global.prefix;
  deploy =
    pkgs.writeShellScriptBin (prefix + "-deploy")
      ''
        set -euo pipefail

        set +e && nixops info -d ${prefix} > /dev/null 2> /dev/null
        info=$? && set -e

        if test $info -eq 1
        then
          echo "Creating deployment..."
          nixops create -d ${prefix}
        fi

        nixops deploy -k -d ${prefix} --allow-reboot --confirm
      '';
  info =
    pkgs.writeShellScriptBin (prefix + "-info")
      ''
        set -euo pipefail

        nixops info -d ${prefix}
      '';
  k6 =
    pkgs.writeShellScriptBin (prefix + "-k6")

      ''
        set -euo pipefail

        nixops ssh -d ${prefix} client k6 run -q --vus $1 - < $2
      '';
  k6VariedVus =
    pkgs.writeShellScriptBin (prefix + "-k6-vary-vus")
      ''
        set -euo pipefail

        for i in '10' '50' '100'; do
          echo -e "\n"
          ${prefix}-k6 $i $1
        done
      '';
  clientPgBench =
    pkgs.writeShellScriptBin (prefix + "-pgbench")
      ''
        set -euo pipefail

        host=$([ "$PGRSTBENCH_SEPARATE_PG" = "true" ] && echo "pg" || echo "pgrst")
        # uses the full cores of the instance and prepared statements
        nixops ssh -d ${prefix} client pgbench postgres -h $host -U postgres -j 16 -T 30 -c $1 --no-vacuum -f - < $2
      '';
  clientPgBenchVaried =
    pkgs.writeShellScriptBin (prefix + "-pgbench-vary-clients")
      ''
        set -euo pipefail

        for i in '10' '50' '100'; do
          echo -e "\n"
          ${prefix}-pgbench $i $1
        done
      '';
  ## execute a command by varing the size of pg instances, currently hardcoded to some m5a instances
  ## pgrstbench-vary-pg pgrstbench-pgbench-varied-clients pgbench/GETSingle.sql > pgbench/results/PGBENCH_GET_SINGLE.txt
  executeVaryAllPgInstances =
    pkgs.writeShellScriptBin (prefix + "-vary-pg")
      ''
        set -euo pipefail

        for instance in 'm5a.large' 'm5a.xlarge' 'm5a.2xlarge' 'm5a.4xlarge' 'm5a.8xlarge'; do
          export PGRSTBENCH_PG_INSTANCE_TYPE="$instance"

          ${prefix}-deploy

          echo -e "\nInstance: $PGRSTBENCH_PG_INSTANCE_TYPE\n"
          $@
        done
      '';
  ## execute a command by varing the size of pg and pgrst instances, currently hardcoded to some m5a instances
  ## pgrstbench-vary-pg-pgrst pgrbench-k6-varied-vus k6/GETSingle.js > k6/results/LB_K6_GET_SINGLE.txt
  executeVaryAllPgPgrstInstances =
    pkgs.writeShellScriptBin (prefix + "-vary-pg-pgrst")
      ''
        set -euo pipefail

        counter=0

        for instance in 'm5a.large' 'm5a.xlarge' 'm5a.2xlarge' 'm5a.4xlarge' 'm5a.8xlarge' 'm5a.12xlarge' 'm5a.16xlarge'; do
          export PGRSTBENCH_PG_INSTANCE_TYPE="$instance"
          export PGRSTBENCH_PGRST_INSTANCE_TYPE="$instance"
          export PGRSTBENCH_PGRST_POOL=$((100 + counter*50))

          counter=$((counter + 1))

          ${prefix}-deploy

          sleep 2s # TODO: sleep until pgrest establishes a connection to pg, this should be handled in a k6 setup

          echo -e "\nPostgreSQL instance: $PGRSTBENCH_PG_INSTANCE_TYPE\n"
          echo -e "PostgREST instance: $PGRSTBENCH_PGRST_INSTANCE_TYPE\n"
          echo -e "PostgREST Pool: $PGRSTBENCH_PGRST_POOL\n"
          $@
        done
      '';
  ssh =
    pkgs.writeShellScriptBin (prefix + "-ssh")
      ''
        set -euo pipefail

        nixops ssh -d ${prefix} $1
      '';
  destroy =
    pkgs.writeShellScriptBin (prefix + "-destroy")
      ''
        set -euo pipefail

        nixops destroy -d ${prefix} --confirm

        nixops delete -d ${prefix}

        rm -rf .deployment.nixops*
      '';
in
pkgs.mkShell {
  buildInputs = [
    (pkgs.nixops_unstable_minimal.withPlugins (ps: [ ps.nixops-aws ]))
    deploy
    info
    k6
    k6VariedVus
    ssh
    destroy
    clientPgBench
    clientPgBenchVaried
    executeVaryAllPgInstances
    executeVaryAllPgPgrstInstances
  ];
  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:."
    export HISTFILE=.history

    export PGRSTBENCH_AWS_PROFILE="default"

    export PGRSTBENCH_WITH_NGINX="true"
    export PGRSTBENCH_WITH_UNIX_SOCKET="true"
    export PGRSTBENCH_SEPARATE_PG="true"

    export PGRSTBENCH_CLIENT_INSTANCE_TYPE="m5a.xlarge"
    export PGRSTBENCH_PG_INSTANCE_TYPE="t3a.nano"
    export PGRSTBENCH_PGRST_INSTANCE_TYPE="t3a.nano"
    export PGRSTBENCH_PGRST_POOL="20"
    export PGRSTBENCH_PG_LOGGING="false"
  '';
}
