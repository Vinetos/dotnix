# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };


  # Enable networking
  networking = {
    hostName = "framework"; # Define your hostname.
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    extraHosts = ''
      127.0.0.1 dps.epita.local
    '';
    firewall.checkReversePath = false;
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "us";

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vinetos = {
    isNormalUser = true;
    extraGroups = [ 
      "networkmanager" "wheel" "video" "docker" 
      "dialout" # Arduino
    ];
  };
  
  # Enable automatic login for the user.
  services.getty.autologinUser = "vinetos";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.overlays = import ../overlays;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    firefox
    wireguard-tools
  ];

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
    libinput.enable = true;
    layout = "us";
    xkbVariant = "intl";
  };
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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable PCSCD for smart card
  services.pcscd.enable = true;

  # Digital
  services.fprintd.enable = true;

  # Hardware deamon 
  services.fwupd.enable = true;

  # Disable Power Button
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';


  # Configure Nix
  nix = {
    package = pkgs.nixUnstable; # Get latest version to enable flakes
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
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
  system.stateVersion = "22.11"; # Did you read the comment?

}
