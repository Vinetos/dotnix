{ config
, inputs
, lib
, pkgs
, ...
}: {
  imports = [ ./hyprpaper.nix ./hyprland.nix ];

  home.sessionVariables = {
    # upscale steam
    GDK_SCALE = "1";
  };

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
