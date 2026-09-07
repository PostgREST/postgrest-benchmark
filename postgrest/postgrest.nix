{ stdenv, fetchurl, lib, postgrestBin ? "", postgrestVer ? "" }:

let
  usePostgrestBin = postgrestBin != "";
  versions = {
    "v14.5" = "sha256-q1zH6XTUlARHmRgEWIz7iz97LFe2kfCQXfBNUe3mlHA=";
    "v14.6" = "sha256-2Qpmj3JQ3E5qllgNMy09A4Sp6Y8ZN66Bp5JfXQHyFbY=";
    "v14.7" = "sha256-P7jYOxC5ZNAljPR9Oxd12MOOS4+ueR+e+w51UJc8aWA=";
    "v14.8" = "sha256-FypVrrzubXviw+oWR2/KaaIVr81o09GEm3VVh4kJ8LA=";
    "v14.9" = "sha256-H1b37C0Fe/cpcrsV85875/fnzZXROyOXlEvzDx+1AiQ=";
    "v14.10" = "sha256-e4rp0r7rzJZiXdE56ppAD/iQD0iSA70g8WlqOeXaKaU=";
    "v14.11" = "sha256-Zb9UTwL+RiAb9O5kWxQd/+1Di+0sepUBtXO389ZWg4I=";
    "v14.12" = "sha256-CG4c6FtZfNadjg7Qlpq97LS8Y1cuqmOxYsbP2pk8BIc=";
    "v14.13" = "sha256-KgU3QRzXnHGA+GaaZIjVgTuJ+T+n5IaRVRKsqW8am88=";
    "v14.14" = "sha256-4mJBDOfmH2f7vCHhIvozTaa3cDj5eIE/oJXV4pUSJ9A=";
    "v14.15" = "sha256-TnjH8GWmw281DHF39fqbt36jgMZ7i/QPL8kTDYV2eNw=";
    "v14.16" = "sha256-NriuFA8YjPzWADSUgFvzWkHolfiMEr6Rg9YPkXghRcY=";
    "v14.17" = "sha256-1uE5JkV0h8mbdzZteV3PoycAVU0I1BgTHZpOo/bKJeM=";
    "v16.0" = "sha256-kMkzxhPc9ci8JlWpRlOd539SkgkUtwyiIA0oXmRoOj4=";
    "v16.1" = "sha256-uYbJJs8WocXZeVTFfTpu3YlKXaIlw/P8DCXcQQUAndc=";
    "v16.2" = "sha256-RxJZW6rg9dhKUn1VoRFm1r9Nmw8dECUFxenVkhl4fwg=";
  };
  selectedVersion = if postgrestVer == "" then "v14.17" else postgrestVer;
in

stdenv.mkDerivation rec {
  name = if usePostgrestBin then "postgrest-devel" else "postgrest";
  version = if usePostgrestBin then "devel" else selectedVersion;
  passthru = { inherit versions; };
  src = if usePostgrestBin then postgrestBin else fetchurl {
    url = "https://github.com/PostgREST/postgrest/releases/download/${version}/postgrest-${version}-linux-static-x86-64.tar.xz";
    sha256 = versions.${selectedVersion};
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
