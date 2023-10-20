{ config
, pkgs
, inputs
, ...
}: {
  programs.hyprland.enable = true;
  # add hyprland to display manager sessions
  services.xserver.displayManager.sessionPackages = [ inputs.hyprland.packages.${pkgs.hostPlatform.system}.default ];
  security.pam.services.swaylock = {};
}
