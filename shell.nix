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

        echo -e "\nRunning k6 with $1 vus"
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

        echo -e "\nRunning pgbench with $1 clients"
        # uses the full cores of the instance and prepared statements
        # || true is added because the command might fail on lower instances with FATAL: sorry, too many clients already
        nixops ssh -d ${prefix} client pgbench-tuned -c $1 -f - < $2 || true
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
  pgbenchK6Varied =
    pkgs.writeShellScriptBin (prefix + "-pgbench-k6-vary")
      ''
        set -euo pipefail

        for i in '10' '50' '100'; do
          echo -e "\n"
          ${prefix}-pgbench $i $1
          ${prefix}-k6 $i $2
        done
      '';

  ## execute a command by varing the size of pg and pgrst instances
  ## postgrest-bench-vary-instances postgrest-bench-pgbench-k6-vary pgbench/GETSingle.sql k6/GETSingle.js > GETSINGLE2.txt
  executeVaryInstances =
    pkgs.writeShellScriptBin (prefix + "-vary-instances")
      ''
        set -euo pipefail

        for instance in 't3a.nano' 't3a.xlarge' 't3a.2xlarge' 'm5a.4xlarge' 'm5a.8xlarge'; do
          export PGRSTBENCH_EC2_INSTANCE_TYPE="$instance"

          if [[ "$PGRSTBENCH_SEPARATE_PG" == "true" ]]; then
            echo -e "\nUsing a $instance EC2 instance type for pg and pgrst servers\n"
          else
            echo -e "\nUsing a $instance EC2 instance type for the pgrst server\n"
          fi

          ${prefix}-deploy

          sleep 2s # TODO: sleep until pgrest establishes a connection to pg, this should be handled in a k6 setup
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
    pgbenchK6Varied
    executeVaryInstances
  ];
  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:."
    export HISTFILE=.history

    export PGRSTBENCH_AWS_PROFILE="default"

    export PGRSTBENCH_WITH_NGINX="true"
    export PGRSTBENCH_WITH_UNIX_SOCKET="true"
    export PGRSTBENCH_SEPARATE_PG="false"

    export PGRSTBENCH_EC2_INSTANCE_TYPE="t3a.nano"
    export PGRSTBENCH_PG_LOGGING="false"
  '';
}
