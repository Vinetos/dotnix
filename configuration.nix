# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, options, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Home-Manager as system module
      <home-manager/nixos>
    ];

  # Bootloader configuration.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    timeout = 5;
    systemd-boot.enable = true; 
    systemd-boot.configurationLimit = 5;
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Always use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  # Configure X11 + i3 Environment.
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    
    layout = "fr";
    xkbOptions = "eurosign:e, compose:menu, grp:alt_shift_toggle";

    libinput = {
      enable = true;
      touchpad.naturalScrolling = false;
      # accelProfile = "flat";
    };

    displayManager = {
    	defaultSession = "none+i3";
      autoLogin = {
        enable = true;
        user = "vinetos";
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

    videoDrivers = [ "nvidia" ];

    screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
    '';


   };
  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Sound has to be disabled with pipewire.
  sound.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  # Bluetooth config
  environment.etc = {
	"wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
		bluez_monitor.properties = {
			["bluez5.enable-sbc-xq"] = true,
			["bluez5.enable-msbc"] = true,
			["bluez5.enable-hw-volume"] = true,
			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
		}
	'';
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vinetos = {
    isNormalUser = true;
    description = "Vinetos";
    extraGroups = [ "networkmanager" "wheel" "video" "docker" ];
    packages = with pkgs; [
      firefox
    ];
  };
  
  # Configure home-manager for user vinetos
  home-manager.users.vinetos = import /home/vinetos/.config/nixpkgs/home.nix;
  home-manager.useGlobalPkgs = true; # By default, Home Manager uses a private pkgs instance that is configured via the home-manager.users.<name>.nixpkgs options. Here, we use the global nixpkgs.
  home-manager.useUserPackages = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      nvidia-offload
      vim  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  }; 
 
  # List services that you want to enable:

  services.logind.extraConfig = 
  ''
    HandleLidSwitch=hibernate
    HandlePowerKey=ignore
  '';

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable PCSCD for smart card
  services.pcscd.enable = true;

  # Hadoop
  services.hadoop = {
     hbase.master.initHDFS = true;
     hdfs.namenode = {
       enable = true;
       formatOnInit = true;
       restartIfChanged = true;
     };
     hdfs.datanode = {
       enable = true;
       restartIfChanged = true;
     };
     yarn.resourcemanager.enable = true;
     
     coreSite = {
         "fs.defaultFS" = "hdfs://nixos:9000";
         "hadoop.proxyuser.dataflair.groups" = "*";
         "hadoop.proxyuser.dataflair.hosts" = "*";
         "hadoop.proxyuser.server.hosts" = "*";
         "hadoop.proxyuser.server.groups" = "*";
     };
     hdfsSite = {
       "dfs.replication" = "1";
       "dfs.permissions.superusergroup" = "wheel";
     };

     mapredSite = {
         "mapreduce.framework.name" = "yarn";
     };
     yarnSite = {
         "yarn.nodemanager.aux-services" = "mapreduce_shuffle";
         "yarn.nodemanager.env-whitelist" = "JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME";
     };
    };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable auto-upgrade
  system.autoUpgrade.enable = true;

  # Configure Nix
  nix = {
    package = pkgs.nixUnstable; # Get latest version to enable flakes
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    #nixPath = options.nix.nixPath.default ++ [ "nixpkgs-overlays=/etc/nixos/overlays" ];
    # Automatic GC and optimize store
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
