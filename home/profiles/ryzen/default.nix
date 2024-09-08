{ pkgs, lib, ... }:
{
 imports = [
    ../../programs
    ../../services
    ../../terminals/kitty.nix
  ];
  
  wayland.windowManager.hyprland.settings = {
    device = [
      {
        name = "logitech-usb-receiver-keyboard";
        kb_layout = "fr";
        kb_variant = "fr";
      }
    ];
  };

  programs = {
    git = {
      # Signing Module
      signing = {
        signByDefault = false;
      };
      # User config
      userName = "Vinetos";
      userEmail = "valentin" + "@" + "vinetos" + "." + "fr";
    };
  };


}
