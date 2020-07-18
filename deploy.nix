let
  region = "us-east-2";
  accessKeyId = "dev"; ## aws profile
  pgrst = import ./pgrst.nix { stdenv = pkgs.stdenv; fetchurl = pkgs.fetchurl; };
in {
  network.description = "postgrest benchmark";

  resources = {
    ec2KeyPairs.pgrstKeyPair     = { inherit region accessKeyId; };
    elasticIPs.pgrstIP           = { inherit region accessKeyId; };
    ec2SecurityGroups.pgrstGroup = {
      inherit region accessKeyId;
      name        = "pgrstbench-group";
      description = "postgrest benchmark security group";
      rules = [
        { fromPort = 22;  toPort = 22;  sourceIp = "0.0.0.0/0"; }
        { fromPort = 80;  toPort = 80;  sourceIp = "0.0.0.0/0"; }
        { fromPort = 443; toPort = 443; sourceIp = "0.0.0.0/0"; }
      ];
    };
  };

  main = { config, pkgs, resources, ... }: {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = "c5.large";
        associatePublicIpAddress = true;
        keyPair                  = resources.ec2KeyPairs.pgrstKeyPair;
        elasticIPv4              = resources.elasticIPs.pgrstIP;
        securityGroups           = [ resources.ec2SecurityGroups.pgrstGroup ];
      };
    };

    environment.systemPackages = [
      pkgs.cloud-utils # For growpart. If we don't have this from the start, we risk not having enough space to install it and resizing the disk.
      pgrst
    ];

    # Disallow ssh login with password
    services.openssh = {
      passwordAuthentication          = false;
      challengeResponseAuthentication = false;
    };

    # By default it logs to /var/spool/nginx.
    # For getting a log file from the remote nixos machine use:
    # nixops scp -d <name> --from main /var/spool/nginx/logs/access.log .
    services.nginx = {
      enable = true;
      config = ''
        worker_processes 1; # check with nproc

        events {
          worker_connections 1024; # check with ulimit -n
        }

        http {
          include ${pkgs.nginx}/conf/mime.types;

          access_log logs/access.log  main buffer=32k flush=5m;

          server {
            listen 80 default_server;

            location /api/ {
              default_type  application/json;
              proxy_hide_header Content-Location;
              add_header Content-Location  /api/$upstream_http_content_location;
              proxy_set_header  Connection "";
              proxy_http_version 1.1;
              proxy_pass http://127.0.0.1:3000/;
            }
          }
        }
      '';
    };

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_11;
      authentication = pkgs.lib.mkOverride 10 ''
        local   all all trust
        host    all all 127.0.0.1/32 trust
        host    all all ::1/128 trust
      '';
      # Here goes the sample db
      #initialscript = pkgs.writetext "initscript" ''
      #'';
    };

    systemd.services.postgrest = {
      enable      = true;
      description = "postgrest daemon";
      after       = [ "postgresql.service" "nginx.service" ];
      wantedBy    = [ "multi-user.target" ];
      serviceConfig.ExecStart = "${pgrst}/bin/postgrest ${./pgrst.conf}";
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
