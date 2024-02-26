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
        kb_variant = fr_nodeadkeys
      }

      device {
        name = at-translated-set-2-keyboard
        kb_layout = ch
        kb_variant = fr_nodeadkeys
      }
    '';

    # Custom git configuration
    programs.git = {
      # Signing Module
      signing = {
        key = "3EC1FE8DF090B8CF";
        signByDefault = true;
      };

      # User config
      userName = "Valentin Chassignol";
      userEmail = "valentin" + "." + "chassignol" + "@" + "infomaniak" + "." + "com";
    };

    home.packages = with pkgs; [
      openssl
      traceroute
      dig
      wget
      openvpn
      remmina
      virt-manager
      kchat
    ];

}
