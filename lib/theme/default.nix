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
  };

}
