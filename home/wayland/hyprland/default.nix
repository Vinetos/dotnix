{ config
, inputs
, lib
, pkgs
, ...
}: {
  imports = [ ./hyprpaper.nix ./config.nix ];

  home.sessionVariables = {
    # upscale steam
    GDK_SCALE = "1";
  };

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
