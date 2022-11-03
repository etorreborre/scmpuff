# Replace "stdenv" with the namespace or name of your language's builder
{ self, stdenv, autoPatchelfHook }:
# Replace "stdenv.mkDerivation" with your language's builder
stdenv.mkDerivation {
  pname = "scmpuff";
  version = "0.5.0";

  sourceRoot = ".";

  src = fetchurl {
    url = "https://github.com/mroth/scmpuff/releases/download/v${version}/scmpuff_${version}_macOS_x64.tar.gz";
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
    install -m755 -D scmpuff_${version}_macOS_x64 $out/bin/scmpuff
  '';

  meta = with lib; {
    homepage = "https://github.com/etorreborre/scmpuff";
    description = "scmpuff binary";
    platforms = platforms.darwin;
    architectures = [ "x86" ];
  };

}
