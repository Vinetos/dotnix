{ config
, inputs
, lib
, pkgs
, ...
}: {
  imports = [ ./config.nix ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar-hyprland;
    systemd.enable = true;
    style = ./style.css;
  };
}

