{ pkgs, ... }:
{
  # Add hyprctl to waybar env : https://github.com/hyprwm/Hyprland/issues/1835
  systemd.user.services.waybar.Service.Environment = "PATH=/run/wrappers/bin:${pkgs.hyprland}/bin";

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}

