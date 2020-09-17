let
  region = "us-east-2";
  accessKeyId = "dev"; ## aws profile
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

  main = { config, pkgs, resources, ... }:
  let pgrst = import ./pgrst.nix { stdenv = pkgs.stdenv; fetchurl = pkgs.fetchurl; }; in
  {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        inherit region accessKeyId;
        instanceType             = "t2.nano";
        associatePublicIpAddress = true;
        ebsInitialRootDiskSize   = 30;
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

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_11;
      authentication = pkgs.lib.mkOverride 10 ''
        local   all all trust
        host    all all 127.0.0.1/32 trust
        host    all all ::1/128 trust
      '';
      # Here goes the sample db
      initialScript = ./chinook.sql;
    };

    systemd.services.postgrest = {
      enable      = true;
      description = "postgrest daemon";
      after       = [ "postgresql.service" ];
      wantedBy    = [ "multi-user.target" ];
      serviceConfig.ExecStart = "${pgrst}/bin/postgrest ${./pgrst.conf}";
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
