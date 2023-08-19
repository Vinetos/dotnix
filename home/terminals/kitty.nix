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

      inherit (xcolors) foreground background;
    } // lib.filterAttrs (k: v: (builtins.match "color([0-9]|1[0-5])" k) != null) xcolors
    ;
  };
}
