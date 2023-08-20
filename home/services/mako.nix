{ default, lib, pkgs, ... }:
let
  inherit (default) xcolors;
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
    defaultTimeout = 30 * 1000; # 30s

    extraConfig = ''
      text-alignment=center
      outer-margin=8

      [urgency=high]
      text-color=${xcolors.light-red}
      default-timeout=0
    '';
  };
  #icon-path=/usr/share/icons/Papirus-Dark
  #font=JetBrainsMono Nerd Font 10

}
