{ stdenv, fetchurl, lib, postgrestBin ? "" }:

let
  usePostgrestBin = postgrestBin != "";
in

stdenv.mkDerivation rec {
  name = if usePostgrestBin then "postgrest-devel" else "postgrest";
  version = if usePostgrestBin then "devel" else "v14.17";
  src = if usePostgrestBin then postgrestBin else fetchurl {
    url = "https://github.com/PostgREST/postgrest/releases/download/${version}/postgrest-${version}-linux-static-x86-64.tar.xz";
    sha256 = "sha256-1uE5JkV0h8mbdzZteV3PoycAVU0I1BgTHZpOo/bKJeM=";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = if usePostgrestBin then ''
    install -Dm755 $src $out/bin/postgrest
  '' else ''
    mkdir -p $out/bin
    tar xJvf $src
    cp postgrest $out/bin/postgrest
    chmod +x $out/bin/postgrest
  '';

  # To use a locally built postgREST, go to the postgrest repo and build a static binary (go to nix/README.md),
  # then use the path of the static binary below. Also comment the above installPhase.
  #
  # installPhase =
  #   let path = ../../postgrest/result/bin/postgrest; in
  #   ''
  #    mkdir -p $out/bin
  #    cp ${path} $out/bin/postgrest
  #    chmod +x $out/bin/postgrest
  #   '';
}
