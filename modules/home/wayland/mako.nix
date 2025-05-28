{
  flake,
  lib,
  pkgs,
  ...
}:
let
  inherit (flake.config.theme) xcolors;
in
{
  services.mako = {
    enable = true;

    sort = "-time";
    layer = "top";
    backgroundColor = xcolors.background + "EF"; # Add opacity
    textColor = xcolors.selection-foreground;
    margin = toString 0;
    padding = toString 16;
    borderSize = 0;
    borderRadius = 12;
    icons = true;
    defaultTimeout = 15 * 1000; # 30s
  };
  #icon-path=/usr/share/icons/Papirus-Dark
  #font=JetBrainsMono Nerd Font 10

}
