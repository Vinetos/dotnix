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

  programs.hyprland.enable = true;
    # add hyprland to display manager sessions
    services.displayManager.sessionPackages = [ inputs.hyprland.packages.${pkgs.hostPlatform.system}.default ];
    security.pam.services.swaylock = { };

}
