{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  name = "postgrest-devel";
  version = "devel";
  src = fetchurl {
    url = "https://github.com/PostgREST/postgrest/releases/download/${version}/postgrest-${version}-linux-static-x86-64.tar.xz";
    ## this sha will break often since we're targeting the devel version
    sha256 = "sha256-dll4YhPobWDb8DaBpdeewPoi7NF+vlJy/9sfoZFGwEA=";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    tar xJvf $src
    cp postgrest $out/bin/postgrest
    chmod +x $out/bin/postgrest
  '';
}
