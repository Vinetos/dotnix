{ config
, inputs
, lib
, pkgs
, ...
}: {
  imports = [ ./config.nix ];

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    # upscale steam
    GDK_SCALE = "1";
  };

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
