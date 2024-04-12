{ config
, pkgs
, inputs
, ...
}: {
  programs.hyprland.enable = true;
  # add hyprland to display manager sessions
  services.displayManager.sessionPackages = [ inputs.hyprland.packages.${pkgs.hostPlatform.system}.default ];
  security.pam.services.swaylock = { };
}
