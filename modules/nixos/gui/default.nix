{
  flake,
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  imports = [
    ./hyprland.nix
  ];

  fonts = {
    packages = with pkgs; [
      meslo-lgs-nf
      nerdfonts
    ];
    fontDir.enable = true;
  };

  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  # enable location service
  location.provider = "geoclue2";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    dconf.enable = true;
  };

  services = {
    # provide location
    geoclue2 = {
      enable = true;
      appConfig.gammastep = {
        isAllowed = true;
        isSystem = false;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };

    # battery info & stuff
    upower.enable = true;

    flatpak.enable = true;
  };

  services.pipewire.wireplumber.extraConfig = lib.mkIf (config.hardware.bluetooth.enable) {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [
        "hsp_hs"
        "hsp_ag"
        "hfp_hf"
        "hfp_ag"
      ];
    };
  };

  services.xserver = {
    enable = true;
    exportConfiguration = true;
  };
  services.displayManager = {
    enable = true;
    ly.enable = true;
  };
  services.libinput.enable = true;

  security = {
    # userland niceness
    rtkit.enable = true;
  };

  xdg.portal.enable = true;
}
