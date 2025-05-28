{ config, pkgs, ... }:

{
  fonts.packages = [
    (pkgs.stdenv.mkDerivation {
      pname = "wevtimoteo-fonts";
      version = "1.0";
      src = ./fonts;
      installPhase = ''
        install -Dm644 $src/*.ttf -t $out/share/fonts/truetype/
      '';
    })
  ];
}
