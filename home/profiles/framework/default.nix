{ pkgs, lib, ... }:
{
  imports = [
    ../../programs
    ../../services
    ../../terminals/alacritty.nix
    ../../terminals/kitty.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = "DP-3, 1920x1080,0x0,1";
  };

}
