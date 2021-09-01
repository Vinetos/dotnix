# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      device = "nodev";
      efiSupport = true;
      enable = true;
      useOSProber = true;
      version = 2;
      default = "saved";
    };
    systemd-boot.configurationLimit = 10;
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Start networkmanager

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Enable the i3 Environment.
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    
    layout = "us,fr";
    xkbOptions = "eurosign:e, compose:menu, grp:alt_space_toggle";

    libinput = {
      enable = true;
      touchpad.naturalScrolling = false;
      # accelProfile = "flat";
    };
    
    displayManager.lightdm.enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

    videoDrivers = [ "nvidia" ];

   };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vinetos = {
    isNormalUser = true;
    createHome = true;
    extraGroups = [ "wheel" "video" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    wget vim
    any-nix-shell
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    fish = { 
      enable = true;
      promptInit = ''
        any-nix-shell fish --info-right | source
      '';
    };
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;
  
  # Enable auto upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  nix.gc.automatic = true;
}

