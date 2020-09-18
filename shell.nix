let
  nixpkgs = builtins.fetchTarball {
    name = "nixos-20.03";
    url = "https://github.com/nixos/nixpkgs/archive/5272327b81ed355bbed5659b8d303cf2979b6953.tar.gz";
    sha256 = "0182ys095dfx02vl2a20j1hz92dx3mfgz2a6fhn31bqlp1wa8hlq";
  };
  pkgs = import nixpkgs {};
in
pkgs.mkShell {
  buildInputs = [
    pkgs.k6 ## https://k6.io for load testing
    pkgs.nixops
  ];
  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:."
  ''; # Needed by nixops to use the pinned version
}
