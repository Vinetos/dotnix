{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  imports = [
    self.inputs.hyprland.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    pkgs.kitty
  ];

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # add hyprland to display manager sessions
  services.displayManager.sessionPackages = [
    inputs.hyprland.packages.${pkgs.hostPlatform.system}.default
  ];
  security.pam.services.swaylock = { };

}