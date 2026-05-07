# Hyprland specific cnnfiguration for NixOS based hosts.
{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  # Import the module
  imports = [
    inputs.niri.nixosModules.niri
  ];

  # Install the default shell
  environment.systemPackages = with pkgs; [
    pkgs.kitty
  ];

  programs.niri.enable = true;

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = pkgs.niri-unstable;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
