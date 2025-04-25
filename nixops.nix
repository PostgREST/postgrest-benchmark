let
  pkgs = import <nixpkgs> {};
  sampleDb = ./sql/chinook.sql;
  global = (import ./global.nix);
  prefix = global.prefix;
  durationSeconds = global.durationSeconds;
  region = global.region;
  nixosAMI = builtins.toString (builtins.readFile ./${global.nixosAMIFile});
  accessKeyId = builtins.getEnv "PGRSTBENCH_AWS_PROFILE";
  maxFileDescriptors = 500000;
  env = {
    withNginx             = builtins.getEnv "PGRSTBENCH_WITH_NGINX" == "true";
    withUnixSocket        = builtins.getEnv "PGRSTBENCH_WITH_UNIX_SOCKET" == "true";
    withSeparatePg        = builtins.getEnv "PGRSTBENCH_SEPARATE_PG" == "true";
    ec2InstanceType       = builtins.getEnv "PGRSTBENCH_EC2_INSTANCE_TYPE";
    ec2ClientInstanceType = builtins.getEnv "PGRSTBENCH_EC2_CLIENT_INSTANCE_TYPE";
    pgrstUseDevel         = builtins.getEnv "PGRSTBENCH_USE_DEVEL" == "true";
    pgrstJWTCacheEnabled  = builtins.getEnv "PGRSTBENCH_JWT_CACHE_ENABLED" == "true";
    withPgLogging     =
      pkgs.lib.optionalAttrs (builtins.getEnv "PGRSTBENCH_PG_LOGGING" == "true") {
        logging_collector = "on";
        log_directory = "pg_log";
        log_filename = "postgresql-%Y-%m-%d.log";
        log_statement = "all";
      };
  };
  pgService = settings: cidrBlock: {
      enable = true;
      package = pkgs.postgresql_12;
      authentication = ''
        local   all all trust
        host    all all 127.0.0.1/32 trust
        host    all all ::1/128 trust
        host    all all ${cidrBlock} trust
      '';
      enableTCPIP = true; # listen_adresses = *
      settings = settings // env.withPgLogging;
      initialScript = sampleDb;
  };
  postgrest = if env.pgrstUseDevel
    then pkgs.callPackage ./postgrest/postgrest-devel.nix {}
    else pkgs.callPackage ./postgrest/postgrest.nix {};
in {
  network.storage.legacy = {
    databasefile = "~/.deployments.nixops";
  };

  network.description = "postgrest benchmark";

  # Provisioning
  resources = {
    ec2KeyPairs.pgrstBenchKeyPair  = { inherit region accessKeyId; };
    # Dedicated VPC
    vpc.pgrstBenchVpc = {
      inherit region accessKeyId;
      name = "${prefix}-vpc";
      enableDnsSupport = true;
      enableDnsHostnames = true;
      cidrBlock = "10.0.0.0/24";
    };
    vpcSubnets.pgrstBenchSubnet = {resources, ...}: {
      inherit region accessKeyId;
      name = "${prefix}-subnet";
      zone = "${region}a";
      vpcId = resources.vpc.pgrstBenchVpc;
      cidrBlock = "10.0.0.0/24";
      mapPublicIpOnLaunch = true;
    };
    vpcInternetGateways.pgrstBenchIG = { resources, ... }: {
      inherit region accessKeyId;
      name = "${prefix}-ig";
      vpcId = resources.vpc.pgrstBenchVpc;
    };
    vpcRouteTables.pgrstBenchRT = { resources, ... }: {
      inherit region accessKeyId;
      name = "${prefix}-rt";
      vpcId = resources.vpc.pgrstBenchVpc;
    };
    vpcRoutes.IGRoute = { resources, ... }: {
      inherit region accessKeyId;
      routeTableId = resources.vpcRouteTables.pgrstBenchRT;
      destinationCidrBlock = "0.0.0.0/0";
      gatewayId = resources.vpcInternetGateways.pgrstBenchIG;
    };
    vpcRouteTableAssociations.pgrstBenchAssoc = { resources, ... }: {
      inherit region accessKeyId;
      subnetId = resources.vpcSubnets.pgrstBenchSubnet;
      routeTableId = resources.vpcRouteTables.pgrstBenchRT;
    };
    ec2SecurityGroups.pgrstBenchSecGroup = {resources, ...}: {
      inherit region accessKeyId;
      name  = "${prefix}-sec-group";
      vpcId = resources.vpc.pgrstBenchVpc;
      rules = [
        { fromPort = 80;  toPort = 80;    sourceIp = "0.0.0.0/0"; }
        { fromPort = 22;  toPort = 22;    sourceIp = "0.0.0.0/0"; }
        # protocol -1 allows icmp traffic in addition to tcp/udp
        { protocol = "-1"; fromPort = 0;   toPort = 65535; sourceIp = resources.vpcSubnets.pgrstBenchSubnet.cidrBlock; } # For internal access on the VPC
      ];
    };
  };

  pgrst = {nodes, config, resources, ...}:
  {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             =
          if builtins.stringLength env.ec2InstanceType == 0
          then "t3a.nano"
          else env.ec2InstanceType;
        associatePublicIpAddress = true;
        ebsInitialRootDiskSize   = 10;
        keyPair                  = resources.ec2KeyPairs.pgrstBenchKeyPair;
        subnetId                 = resources.vpcSubnets.pgrstBenchSubnet;
        securityGroupIds         = [resources.ec2SecurityGroups.pgrstBenchSecGroup.name];
        ami = nixosAMI;
      };
    };
    boot.loader.grub.device = pkgs.lib.mkForce "/dev/nvme0n1"; # Fix for https://github.com/NixOS/nixpkgs/issues/62824#issuecomment-516369379

    environment.systemPackages = [
      postgrest
      pkgs.htop
    ];

    services.postgresql = pkgs.lib.mkIf (!env.withSeparatePg)
                          (pgService
                            (builtins.getAttr config.deployment.ec2.instanceType (import ./postgresql/tuning.nix))
                            resources.vpcSubnets.pgrstBenchSubnet.cidrBlock);

    systemd.services =
    let
      pgrstSock = "/tmp/pgrst.sock";
    in
    {
      postgrest =
      let
        pgHost =
          if env.withSeparatePg then "pg"
          else if env.withUnixSocket then ""
          else "localhost";
        pgrstConf = pkgs.writeText "pgrst.conf" ''
          db-uri = "postgres://postgres@${pgHost}/postgres"
          db-schema = "public"
          db-anon-role = "postgres"
          db-use-legacy-gucs = false
          db-pool = ${builtins.toString (builtins.getAttr config.deployment.ec2.instanceType (import ./clientPool.nix))}
          db-pool-timeout = 3600
          ${
            if env.pgrstJWTCacheEnabled
              then "jwt-cache-max-lifetime = 86400"
              else ""
          }
          admin-server-port = 3001

          ${
            if env.withNginx && env.withUnixSocket
            then ''
              server-unix-socket = "${pgrstSock}"
              server-unix-socket-mode = "777"
            ''
            else if env.withNginx
            then ''
              server-port = "3000"
            ''
            else ''
              server-port = "80"
            ''
          }

          jwt-secret = "reallyreallyreallyreallyverysafe"
        '';
      in
      {
        enable      = true;
        description = "postgrest daemon";
        after       = [ "postgresql.service" ];
        wantedBy    = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${postgrest}/bin/postgrest ${pgrstConf}";
          Restart = "always";
          LimitNOFILE = maxFileDescriptors;
        };
      };
      nginx =
      let
        nginxConf = pkgs.writeText "nginx.conf" ''
          daemon off;
          worker_processes auto;

          events {
            worker_connections 1024;
          }

          http {
            upstream postgrest {
              ${
                if env.withUnixSocket
                then
                ''
                  server unix:${pgrstSock};
                ''
                else ''
                  server localhost:3000;
                ''

              }
              keepalive 64;
              keepalive_timeout 120s;
            }

            server {
              listen 80 default_server;
              listen [::]:80 default_server;

              location / {
                proxy_set_header  Connection "";
                proxy_set_header  Accept-Encoding  "";
                proxy_http_version 1.1;
                proxy_pass http://postgrest/;
              }
            }
          }
        '';
        execCommand = "${pkgs.nginx}/bin/nginx -c '${nginxConf}'";
      in
      {
        enable      = true;
        description = "Nginx Web Server";
        after       = [ "network.target" ];
        wantedBy    = [ "multi-user.target" ];
        startLimitIntervalSec = 60;
        stopIfChanged = false;
        preStart = "${execCommand} -t";
        serviceConfig = {
          ExecStart = execCommand;
          ExecReload = [
            "${execCommand} -t"
            "${pkgs.coreutils}/bin/kill -HUP $MAINPID"
          ];
          Restart = "always";
          RestartSec = "10";
          # taken from https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix
          # maybe not all are necessary
          # Runtime directory and mode
          RuntimeDirectory = "nginx";
          RuntimeDirectoryMode = "0750";
          # Cache directory and mode
          CacheDirectory = "nginx";
          CacheDirectoryMode = "0750";
          # Logs directory and mode
          LogsDirectory = "nginx";
          LogsDirectoryMode = "0750";
          # Proc filesystem
          ProcSubset = "pid";
          ProtectProc = "invisible";
          # New file permissions
          UMask = "0027"; # 0640 / 0750
          # Security
          NoNewPrivileges = true;
          LimitNOFILE = maxFileDescriptors;
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 5432 ];
    networking.hosts = pkgs.lib.optionalAttrs env.withSeparatePg {
      "${nodes.pg.config.networking.privateIPv4}" = [ "pg" ];
    };
  };

  client = {config, nodes, resources, ...}: {
    environment.systemPackages =
    let
      pgbenchPoolSize = builtins.toString (builtins.getAttr config.deployment.ec2.instanceType (import ./clientPool.nix));
    in
    [
      (pkgs.writeShellScriptBin "pgbench-tuned"
      ''
        set -euo pipefail

        echo -e "\nRunning pgbench with ${pgbenchPoolSize} clients and threads"

        ${pkgs.postgresql_12}/bin/pgbench postgres -U postgres \
          -h ${if env.withSeparatePg then "pg" else "pgrst"} \
          -T ${builtins.toString durationSeconds} --no-vacuum \
          -M prepared \
          --jobs ${pgbenchPoolSize} \
          -c ${pgbenchPoolSize} \
          $@
      '')
      (pkgs.writeShellScriptBin "k6-tuned"
      ''
        set -euo pipefail

        ${pkgs.k6}/bin/k6 run -q \
          --duration ${builtins.toString durationSeconds + "s"} \
          $@
      '')
    ];
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = if builtins.stringLength env.ec2ClientInstanceType != 0
                                     then env.ec2ClientInstanceType
                                   else if builtins.stringLength env.ec2InstanceType != 0
                                     then env.ec2InstanceType
                                   else
                                     "t3a.nano";
        associatePublicIpAddress = true;
        keyPair                  = resources.ec2KeyPairs.pgrstBenchKeyPair;
        subnetId                 = resources.vpcSubnets.pgrstBenchSubnet;
        securityGroupIds         = [resources.ec2SecurityGroups.pgrstBenchSecGroup.name];
        ami = nixosAMI;
      };
    };
    boot.loader.grub.device = pkgs.lib.mkForce "/dev/nvme0n1";
    # Tuning from https://k6.io/docs/misc/fine-tuning-os
    boot.kernel.sysctl."net.ipv4.tcp_tw_reuse" = 1;
    security.pam.loginLimits = [ ## ulimit -n
      { domain = "root"; type = "hard"; item = "nofile"; value = "10000"; }
      { domain = "root"; type = "soft"; item = "nofile"; value = "10000"; }
    ];
    networking.hosts = {
      "${nodes.pgrst.config.networking.privateIPv4}" = [ "pgrst" ];
    } // pkgs.lib.optionalAttrs env.withSeparatePg {
      "${nodes.pg.config.networking.privateIPv4}" = [ "pg" ];
    };
  };
}
// pkgs.lib.optionalAttrs env.withSeparatePg
{
  pg = {resources, config, ...}: rec {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = "m5a.8xlarge";
        associatePublicIpAddress = true;
        ebsInitialRootDiskSize   = 10;
        keyPair                  = resources.ec2KeyPairs.pgrstBenchKeyPair;
        subnetId                 = resources.vpcSubnets.pgrstBenchSubnet;
        securityGroupIds         = [resources.ec2SecurityGroups.pgrstBenchSecGroup.name];
        ami = nixosAMI;
      };
    };
    boot.loader.grub.device = pkgs.lib.mkForce "/dev/nvme0n1"; # Fix for https://github.com/NixOS/nixpkgs/issues/62824#issuecomment-516369379

    services.postgresql = pgService
        (builtins.getAttr config.deployment.ec2.instanceType (import ./postgresql/tuning.nix))
        resources.vpcSubnets.pgrstBenchSubnet.cidrBlock;

    networking.firewall.allowedTCPPorts = [ 5432 ];
  };
}
