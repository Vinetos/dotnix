# Hyprland specific cnnfiguration for NixOS based hosts.
{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  # Import the module
  imports = [
    self.inputs.hyprland.nixosModules.default
  ];

  # Install the default shell
  environment.systemPackages = with pkgs; [
    pkgs.kitty
  ];

  # Configure hyprland
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };
  # add hyprland to display manager sessions
  services.displayManager.sessionPackages = [
    inputs.hyprland.packages.${pkgs.hostPlatform.system}.default
  ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Fix mesa missmatch preventing Hyprland to start
  hardware.graphics.package =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.hostPlatform.system}.mesa;

  xdg.portal = {
    enable = true;
    extraPortals = [ inputs.hyprland.packages.${pkgs.hostPlatform.system}.xdg-desktop-portal-hyprland ];
  };

  # Configure pam for hyprlock
  security.pam.services.hyprlock = { };
}
