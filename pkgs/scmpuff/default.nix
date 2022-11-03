# Replace "stdenv" with the namespace or name of your language's builder
{ self,
  stdenv,
  lib,
  alsaLib,
  fetchurl,
  openssl,
  pulseaudio,
  zlib,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "scmpuff";
  version = "0.5.0";
  MACOSX_DEPLOYMENT_TARGET = true;

  sourceRoot = ".";

  src = fetchurl {
    url = "https://github.com/mroth/scmpuff/releases/download/v${version}/scmpuff_${version}_macOS_x64.tar.gz";
    sha256 = "sha256-PoJju37utsJroOQhbC07FMJN8XokpClGSpzsdbtTLAA=";
  };


  # Add buildtime dependencies (not required at runtime)
  # to nativeBuildInputs.
  nativeBuildInputs = [
    #autoPatchelfHook
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
