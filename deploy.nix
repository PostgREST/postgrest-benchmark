let
  region = "us-east-2";
  accessKeyId = "default"; ## aws profile
  pkgs = import <nixpkgs> {};
  conf = let pgrst = import ./pgrst.nix { stdenv = pkgs.stdenv; fetchurl = pkgs.fetchurl; }; in
  {
    environment.systemPackages = [
      pgrst
    ];

    # Disallow ssh login with password
    services.openssh = {
      passwordAuthentication          = false;
      challengeResponseAuthentication = false;
    };

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_11;
      authentication = pkgs.lib.mkOverride 10 ''
        local   all all trust
        host    all all 127.0.0.1/32 trust
        host    all all ::1/128 trust
      '';
      initialScript = ./chinook.sql; # Here goes the sample db
    };

    systemd.services.postgrest = {
      enable      = true;
      description = "postgrest daemon";
      after       = [ "postgresql.service" ];
      wantedBy    = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart =
          let pgrstConf = pkgs.writeText "pgrst.conf" ''
            db-uri = "postgres://postgres@localhost/postgres"
            db-schema = "public"
            db-anon-role = "postgres"

            server-port = 80

            jwt-secret = "reallyreallyreallyreallyverysafe"
          '';
          in
          "${pgrst}/bin/postgrest ${pgrstConf}";
        Restart = "always";
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
in {
  network.description = "postgrest benchmark";

  resources = {
    ec2KeyPairs.pgrstBenchKeyPair     = { inherit region accessKeyId; };
    ec2SecurityGroups.pgrstBenchSecGroup = {
      inherit region accessKeyId;
      name        = "pgrst-bench-sec-group";
      description = "postgrest benchmark security group";
      rules = [
        { fromPort = 22;  toPort = 22;  sourceIp = "0.0.0.0/0"; }
        { fromPort = 80;  toPort = 80;  sourceIp = "0.0.0.0/0"; }
        { fromPort = 443; toPort = 443; sourceIp = "0.0.0.0/0"; }
      ];
    };
  };

  t2nano = {resources, ...}: {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = "t2.nano";
        associatePublicIpAddress = true;
        ebsInitialRootDiskSize   = 10;
        keyPair                  = resources.ec2KeyPairs.pgrstBenchKeyPair;
        securityGroups           = [ resources.ec2SecurityGroups.pgrstBenchSecGroup ];
      };
    };
  } // conf;

  t3anano = {resources, ...}: {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = "t3a.nano";
        associatePublicIpAddress = true;
        ebsInitialRootDiskSize   = 10;
        keyPair                  = resources.ec2KeyPairs.pgrstBenchKeyPair;
        securityGroups           = [ resources.ec2SecurityGroups.pgrstBenchSecGroup ];
      };
    };
    boot.loader.grub.device = pkgs.lib.mkForce "/dev/nvme0n1"; # Fix for https://github.com/NixOS/nixpkgs/issues/62824#issuecomment-516369379
  } // conf;

  client = {resources, ...}: {
    environment.systemPackages = [
      pkgs.k6
    ];
    services.openssh = {
      passwordAuthentication          = false;
      challengeResponseAuthentication = false;
    };
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = "t3a.micro";
        associatePublicIpAddress = true;
        keyPair                  = resources.ec2KeyPairs.pgrstBenchKeyPair;
        securityGroups           = [ resources.ec2SecurityGroups.pgrstBenchSecGroup ];
      };
    };
    boot.loader.grub.device = pkgs.lib.mkForce "/dev/nvme0n1";
    boot.kernel.sysctl."net.ipv4.tcp_tw_reuse" = 1;
    security.pam.loginLimits = [ ## ulimit -n
      { domain = "root"; type = "hard"; item = "nofile"; value = "5000"; }
      { domain = "root"; type = "soft"; item = "nofile"; value = "5000"; }
    ];
  };
}
