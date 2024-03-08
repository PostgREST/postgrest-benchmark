{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "postgrest";
  version = "v12.2.3";
  src = fetchurl {
    url = "https://github.com/PostgREST/postgrest/releases/download/${version}/postgrest-${version}-linux-static-x64.tar.xz";
    sha256 = "sha256-n3EmnmGsOpQCgek/9BV2D1lX5DDkdbpMOInz7efVUnw=";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
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
