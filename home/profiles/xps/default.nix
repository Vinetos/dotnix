{ pkgs, lib, ... }:
{
  imports = [
    ../../programs
    ../../services
    ../../terminals/kitty.nix
  ];

  # TODO: Replace with nix language when merged : https://github.com/nix-community/home-manager/pull/5038
  wayland.windowManager.hyprland.extraConfig = ''
    device {
      name = mx-keys-keyboard
      kb_layout = ch
      kb_variant = fr
    }

    device {
      name = mx-keys-keyboard-2
      kb_layout = ch
      kb_variant = fr
    }

    device {
      name = at-translated-set-2-keyboard
      kb_layout = ch
      kb_variant = fr
    }

    device {
      name = g915-keyboard-keyboard
      kb_layout = fr
      kb_variant =
    }
  '';

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
    openssl
    traceroute
    dig
    wget
    remmina
    virt-manager
    kchat
    pdk
    ruby
    quasselClient
  ];

}
