{
  pkgs,
  lib,
  config,
  default,
  ...
}:
# Wayland config
{
  imports = [
    ./hyprland
  ];

  home.packages = with pkgs; [
    # Clipboard manager
    cliphist

    # utils
    # ocrScript
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wofi
  ];

  xdg.configFile = {
    # General environment
    "uwsm/env".text = ''
      export ELECTRON_OZONE_PLATFORM_HINT=auto
      export NIXOS_OZONE_WL=1
      export ELM_DISPLAY=wl
      export SDL_VIDEODRIVER=wayland
    '';

    # Hyprland-specific
    "uwsm/env-hyprland".text = "";
  };

  gtk.enable = true;

  # Follow GTK configuration for QT apps
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };

  # make stuff work on wayland
  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

}
