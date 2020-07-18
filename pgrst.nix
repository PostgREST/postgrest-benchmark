{ stdenv, fetchurl }:

stdenv.mkDerivation {
  name = "postgrest";
  src = fetchurl {
    url = "https://github.com/PostgREST/postgrest/releases/download/v7.0.1/postgrest-v7.0.1-linux-x64-static.tar.xz";
    sha256 = "0rcqqbvdifj9686qvpd9v24z5ivi209icwmp87k652l435y8r03z";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    tar xJvf $src
    cp postgrest $out/bin/postgrest
    chmod +x $out/bin/postgrest
  '';
}
