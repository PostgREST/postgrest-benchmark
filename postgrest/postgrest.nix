{ stdenv, fetchurl, lib, postgrestBin ? "", postgrestVer ? "" }:

let
  usePostgrestBin = postgrestBin != "";
  versions = {
    "v13.0.0" = "03s4cmyrh7gn7jxjnb42ikdr46avj8lg8gxrmx9izb2948d6pkzr";
    "v13.0.1" = "1qssgwpybrcj1r7qq16k8vb3vjbz566w3fg7jk89nqijbsb56mpa";
    "v13.0.2" = "1w6bi66np8rfjnm8w58k33kfhps6q1mqy6icvnp1r3ba4dxjk1n6";
    "v13.0.3" = "1qllbaqckiixz4wwc8r8bcpfh2ch70h3ny7mx1581d46y43izpz4";
    "v13.0.4" = "04bqc7x1lcw8xs88am2m32ag83hla7d9i3r9w14j7x968y6jq1d0";
    "v13.0.5" = "1dc8vcm23f022dyzr921kscccril082x1if73xlw3rmyiba2pgh5";
    "v13.0.6" = "0j24n4a1pxs6yhlp399i5c93gsc6m05kczhsdxli4i6ma702zdv0";
    "v13.0.7" = "0avn1dd01jc2d9zprm9pxckvl9fs955xi768xlsvgrs0rhfghls1";
    "v13.0.8" = "0yg22696x0v2ml09fr4hnfwwbwfpqi4277sk0ghm8ahip2kp2i7b";
    "v14.0" = "sha256-YD/EawS5hf93WUkNyk6c2qcXSuf7dCSIvLEeE4flX/I=";
    "v14.1" = "sha256-vatqszicoNbB87g2NJFnTbynGHXD8wJh2S2P7N3jUnc=";
    "v14.2" = "sha256-cHAN3LlF7/6oPk7PXSRl1hQnoOa1zBwHUwNPjw5qTbE=";
    "v14.3" = "sha256-PWGaNvBTLHNoV6XW6tFosoZOKjg6sWfWes3T046XUI4=";
    "v14.4" = "sha256-P8boLDSpipffX/r9hvvXueIeA+8tcz1D5+5tDOETVo8=";
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
