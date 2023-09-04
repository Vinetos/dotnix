{ config
, inputs
, lib
, pkgs
, ...
}: {
  imports = [ ./config.nix ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
  };
}

