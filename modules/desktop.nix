{ config
, pkgs
, inputs
, ...
}: {
  fonts = {
    packages = with pkgs; [ meslo-lgs-nf nerdfonts ];
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

  # Sound has to be disabled with pipewire.
  sound.enable = false;

  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
      		bluez_monitor.properties = {
      			["bluez5.enable-sbc-xq"] = true,
      			["bluez5.enable-msbc"] = true,
      			["bluez5.enable-hw-volume"] = true,
      			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      		}
      	'')
  ];

  #  TODO: Once #292115 is merged and has reached nixos-unstable, you'll be able to use services.pipewire.wireplumber.extraLuaConfig as well:
  #
  #  services.pipewire.wireplumber.extraLuaConfig.bluetooth."51-bluez-config" = ''
  #  	bluez_monitor.properties = {
  #  		["bluez5.enable-sbc-xq"] = true,
  #  		["bluez5.enable-msbc"] = true,
  #  		["bluez5.enable-hw-volume"] = true,
  #  		["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
  #  	}
  #  '';


  security = {
    # userland niceness
    rtkit.enable = true;
  };

  xdg.portal.enable = true;
}
