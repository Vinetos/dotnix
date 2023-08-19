{ colorlib
, lib
}: rec {
  colors = import ./colors.nix;

  # #RRGGBB
  xcolors = lib.mapAttrs (_: colorlib.x) colors;

  # rgba(,,,) colors (css)
  rgbaColors = lib.mapAttrs (_: colorlib.rgba) colors;

  wallpaper = builtins.fetchurl rec {
    url = "https://github.com/Vinetos/dotnix/blob/main/home/wallpaper.jpg?raw=true";
    sha256 = "0ybw1lppilx2ds5b941y4y54iawl1lkipwqrswwp088yh2ascmzs";
  };
}
