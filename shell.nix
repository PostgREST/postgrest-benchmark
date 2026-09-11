let
  nixpkgs = builtins.fetchTarball {
    name = "24.05";
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
    sha256 = "sha256:1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
  };
  pkgs = import nixpkgs {};
  python = pkgs.python3.withPackages (ps: [ ps.pandas ps.matplotlib ps.tabulate ]);
  global = import ./global.nix;
  prefix = global.prefix;
  postgrest = pkgs.callPackage ./postgrest/postgrest.nix {};
  postgrestVersions = pkgs.lib.sort pkgs.lib.versionOlder (builtins.attrNames postgrest.versions);
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

        if [ "$#" -lt 3 ]; then
          echo "usage: ${prefix}-k6 VUS DURATION SCRIPT..." >&2
          exit 1
        fi

        vus=$1
        duration=$2
        shift 2

        for script do
          [ -f "$script" ] || continue
          echo -e "\nRunning k6 with $vus vus for $duration: $script" >&2
          # we concat this utils file because we can't import it as regular since it's not on the remote instance
          { cat k6/private/utils.js; cat "$script"; } | nixops ssh -d ${prefix} client k6 run -q \
            --env K6_SCRIPT="$script" \
            --env POSTGREST_VERSION="''${PGRSTBENCH_PGRST_VER:-}" \
            --env PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE="''${PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE:-}" \
            --env PGRSTBENCH_GHC_RTS="''${PGRSTBENCH_GHC_RTS:-}" \
            --duration "$duration" \
            --vus "$vus" -
        done
      '';
  k6VariedVus =
    pkgs.writeShellScriptBin (prefix + "-k6-vary-vus")
      ''
        set -euo pipefail

        for i in '10' '50' '100'; do
          ${prefix}-k6 $i ${builtins.toString global.durationSeconds}s $1
        done
      '';
  clientPgBench =
    pkgs.writeShellScriptBin (prefix + "-pgbench")
      ''
        set -euo pipefail

        # || true is added because the command might fail on lower instances with FATAL: sorry, too many clients already
        nixops ssh -d ${prefix} client pgbench-tuned -f - < $1 || true
      '';
  pgbenchK6Varied =
    pkgs.writeShellScriptBin (prefix + "-pgbench-k6-vary")
      ''
        set -euo pipefail

        ${prefix}-pgbench $1
        ${prefix}-k6-vary-vus $2
      '';

  ## execute a command by varing the size of pg and pgrst instances
  ## postgrest-bench-vary-instances postgrest-bench-pgbench-k6-vary pgbench/GETSingle.sql k6/GETSingle.js > GETSINGLE.txt
  ## postgrest-bench-vary-instances postgrest-bench-k6-vary-vus k6/GETSingle.js > GETSINGLE2.txt
  executeVaryInstances =
    pkgs.writeShellScriptBin (prefix + "-vary-instances")
      ''
        set -euo pipefail

        for instance in 't3a.nano' 't3a.xlarge' 't3a.2xlarge' 'm5a.4xlarge' 'm5a.8xlarge'; do
          export PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE="$instance"

          if [ -z "$PGRSTBENCH_EC2_CLIENT_INSTANCE_TYPE" ]; then
            echo -e "\nUsing a $instance EC2 type for pgrst and client instances\n"
          else
            echo -e "\nUsing a $instance EC2 type for pgrst\n"
          fi

          ${prefix}-deploy

          sleep 2s # TODO: sleep until pgrest establishes a connection to pg, this should be handled in a k6 setup
          $@
        done
      '';

  executeVaryHighInstances =
    pkgs.writeShellScriptBin (prefix + "-vary-high-instances")
      ''
        set -euo pipefail

        for instance in 'm5a.8xlarge' 'm5a.12xlarge' 'm5a.16xlarge'; do
          export PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE="$instance"

          if [ -z "$PGRSTBENCH_EC2_CLIENT_INSTANCE_TYPE" ]; then
            echo -e "\nUsing a $instance EC2 type for pgrst and client instances\n"
          else
            echo -e "\nUsing a $instance EC2 type for pgrst\n"
          fi

          ${prefix}-deploy

          sleep 2s # TODO: sleep until pgrest establishes a connection to pg, this should be handled in a k6 setup
          $@
        done
      '';

  executeVaryRTS =
    pkgs.writeShellScriptBin (prefix + "-vary-rts")
      ''
        set -euo pipefail

        for rts in \
          default \
          '-A32m -n2m' \
          '-A64m -n4m' \
          '-A128m -n8m' \
          '-A256m -n8m' \
          '-N16 -A64m -n4m' \
          '-N32 -A128m -n8m' \
          '-N32 -qn16 -A128m -n8m' \
          '-N32 -qn16 -A256m -n8m' \
          '-N32 -qb -A128m -n8m' \
          '-N32 -qb -qn16 -A256m -n8m'; do
          if [ "$rts" = default ]; then
            rts=""
          fi
          export PGRSTBENCH_GHC_RTS="$rts"
          echo -e "\nUsing RTS settings: $rts for pgrst\n"

          ${prefix}-deploy

          sleep 2s # TODO: sleep until pgrest establishes a connection to pg, this should be handled in a k6 setup
          $@
        done
      '';

  executeVaryPostgrestVersions =
    pkgs.writeShellScriptBin (prefix + "-vary-pgrst")
      ''
        set -euo pipefail

        for version in ${pkgs.lib.concatStringsSep " " (map pkgs.lib.escapeShellArg postgrestVersions)}; do
          export PGRSTBENCH_PGRST_VER="$version"
          echo -e "\nUsing PostgREST $version\n" >&2

          ${prefix}-deploy >&2

          sleep 2s # TODO: sleep until postgREST establishes a connection to pg
          "$@"
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
  generateNixOSAMIFile =
    pkgs.writeShellScriptBin (prefix + "-generate-ami")
      ''
        set -euo pipefail

        # query taken from https://nixos.github.io/amis/
        ${pkgs.awscli}/bin/aws ec2 describe-images --owners 427812963091 \
          --region us-east-2 \
          --filter 'Name=name,Values=nixos/25.11*' 'Name=architecture,Values=x86_64' \
          --query 'sort_by(Images, &CreationDate)[0].ImageId' --output text  \
        | ${pkgs.coreutils}/bin/tr -d '\n' \
        > ${global.nixosAMIFile}

        echo "Wrote result to ${global.nixosAMIFile}"
      '';
  generateReport =
    pkgs.writers.writePython3Bin (prefix + "-generate-report") {
      libraries = with pkgs.python3Packages; [ matplotlib pandas tabulate ];
    }
    (builtins.readFile ./scripts/generate_report.py);

in
pkgs.mkShell {
  buildInputs = [
    python
    (pkgs.nixops_unstable_minimal.withPlugins (ps: [ ps.nixops-aws ]))
    deploy
    info
    k6
    k6VariedVus
    ssh
    destroy
    clientPgBench
    pgbenchK6Varied
    generateReport
    executeVaryInstances
    executeVaryHighInstances
    executeVaryRTS
    executeVaryPostgrestVersions
    generateNixOSAMIFile
  ];
  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:."
    export HISTFILE=.history

    export PGRSTBENCH_AWS_PROFILE="default"

    export PGRSTBENCH_WITH_NGINX="true"
    export PGRSTBENCH_WITH_UNIX_SOCKET="true"
    export PGRSTBENCH_SEPARATE_PG="true"

    export PGRSTBENCH_PGRST_VER="v14.17"
    export PGRSTBENCH_GHC_RTS=""
    export PGRSTBENCH_EC2_PGRST_INSTANCE_TYPE="t3a.nano"
    export PGRSTBENCH_EC2_DB_INSTANCE_TYPE="m5a.8xlarge"
    export PGRSTBENCH_EC2_CLIENT_INSTANCE_TYPE="m5a.8xlarge"
    export PGRSTBENCH_PG_LOGGING="false"
    export PGRSTBENCH_JWT_CACHE_ENABLED="true"
    export PGRSTBENCH_MAX_FDS="true"
  '';
}
