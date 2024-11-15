{ lib, ... }:
let
  colors = import ./colors.nix;
  colorlib = import ../colors.nix;
in
rec {
  theme = {
    # RRGGBB
    colors = colors;
    # #RRGGBB
    xcolors = builtins.mapAttrs (name: c: "#${c}") colors; # TODO: check why usage of colorlib.x return lambdq
    # rgba(,,,) colors (css)
    rgbaColors = lib.mapAttrs (_: colorlib.rgba) colors;
    wallpaper = builtins.fetchurl rec {
      url = "https://github.com/Vinetos/dotnix/blob/main/home/wallpaper.jpg?raw=true";
      sha256 = "0ybw1lppilx2ds5b941y4y54iawl1lkipwqrswwp088yh2ascmzs";
    };
  };

}
