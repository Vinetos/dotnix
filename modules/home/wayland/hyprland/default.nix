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
  cursor = "Bibata-Modern-Classic-Hyprcursor";
  cursorPackage = self.packages.${pkgs.hostPlatform.system}.bibata-hyprcursor;
in
{
  imports = [
    ./hyprpaper.nix
    ./hyprland.nix
  ];

  xdg.dataFile."icons/${cursor}".source = "${cursorPackage}/share/icons/${cursor}";

  home.pointerCursor = {
    gtk.enable = true;
    package = cursorPackage;
    name = cursor;
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  home.sessionVariables = {
    # upscale steam
    GDK_SCALE = "1";
  };

  # enable hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    package = flake.inputs.hyprland.packages.${pkgs.hostPlatform.system}.hyprland;
    systemd.variables = [ "--all" ];
    plugins = [ flake.inputs.hy3.packages.${pkgs.hostPlatform.system}.hy3 ];
  };
}
