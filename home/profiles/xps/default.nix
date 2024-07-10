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
        name = "mx-keys-keyboard";
        kb_layout = "ch";
        kb_variant = "fr";
      }
      {
        name = "mx-keys-keyboard-2";
        kb_layout = "ch";
        kb_variant = "fr";
      }
      {
        name = "at-translated-set-2-keyboard";
        kb_layout = "ch";
        kb_variant = "fr";
      }
    ];
  };

  # Custom git configuration
  programs = {
    git = {
      # Signing Module
      signing = {
        key = "3EC1FE8DF090B8CF";
        signByDefault = true;
      };

      # User config
      userName = "Valentin Chassignol";
      userEmail = "valentin" + "." + "chassignol" + "@" + "infomaniak" + "." + "com";
    };
    ssh = {
      matchBlocks = {
        all = {
          host = "*";
          user = "root";
        };
        infomaniak = {
          host = "*.infomaniak.ch";
          user = "root";
        };
      };
    };
  };


  home.packages = with pkgs; [
    pkgs.dev.openstackclient

    pkgs.unstable.kchat
    openssl
    traceroute
    dig
    wget
    remmina
    virt-manager
    android-studio
    solaar
    parsec-bin
    element-desktop
    librewolf
  ];


}
