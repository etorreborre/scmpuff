# Replace "stdenv" with the namespace or name of your language's builder
{ self, stdenv, autoPatchelfHook }:
# Replace "stdenv.mkDerivation" with your language's builder
stdenv.mkDerivation {
  pname = "scmpuff";
  version = "0.5.0";

  sourceRoot = ".";

  src = fetchurl {
    url = "https://github.com/etorreborre/scmpuff/blob/89c5d68c34d78a71e3c642a37f9ca600d7e06139/scmpuff";
    sha256 = "sha256-4CkijAlenhht8tyk3nBULaBPE0GBf6DVII699/RmmWI=";
  };


  # Add buildtime dependencies (not required at runtime)
  # to nativeBuildInputs.
  nativeBuildInputs = [
    autoPatchelfHook
  ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    install -m755 -D scmpuff $out/bin/scmpuff
  '';

  meta = with lib; {
    homepage = "https://github.com/etorreborre/scmpuff";
    description = "scmpuff binary";
    platforms = platforms.darwin;
    architectures = [ "x86" ];
  };

}
