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
    ./niri.nix
  ];

  home.packages = with pkgs; [
    # Clipboard manager
    cliphist

    # utils
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wofi
  ];

  gtk.enable = true;

  # Follow GTK configuration for QT apps
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };

}
