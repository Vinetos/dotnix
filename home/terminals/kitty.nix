{ default, lib, pkgs, ... }:
let
  inherit (default) xcolors;
in
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = ''
        ${lib.getExe pkgs.fish} --init-command "echo; ${lib.getExe pkgs.neofetch} --disable packages; echo"
      '';
      background_opacity = toString 0.7;

      selection_foreground = xcolors.selection-foreground;
      selection_background = xcolors.selection-background;

      url_color = xcolors.cyan;

      inherit (xcolors) foreground background color0 color1 color2 color3 color4 color5 color6 color7 color8 color9 color10 color11 color12 color13 color14 color15;
    };
  };
}
