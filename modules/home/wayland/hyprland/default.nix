{
  flake,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
let
  cursor = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
in
{
  imports = [
    ./hyprland.nix
  ];

  home.pointerCursor = {
    enable = true;
    package = cursorPackage;
    name = cursor;
    size = 16;
    hyprcursor.enable = true;
    gtk.enable = true;
  };

  gtk = {
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  home.sessionVariables = {
    # upscale steam
    GDK_SCALE = "1";
  };

  # enable hyprland
  wayland.windowManager.hyprland = {
    enable = true;

    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;

    plugins = [ flake.inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3 ];
    systemd.enable = false;
  };
}
