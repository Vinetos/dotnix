{ pkgs, ... }: {

  # Override config for special devices
  # https://github.com/hyprwm/Hyprland/discussions/4768
  #  wayland.windowManager.hyprland.settings = {
  #    device = {
  #      name = mx-keys-keyboard;
  #      kb_layout = "ch";
  #      kb_variant = "fr_nodeadkeys";
  #    };
  #    device = {
  #      name = "at-translated-set-2-keyboard";
  #      kb_layout = "ch";
  #      kb_variant = "fr_nodeadkeys";
  #    };
  #  };

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
  ];
}
