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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-4850aef2-6ab8-407b-ad6d-139b3aedac8f".device = "/dev/disk/by-uuid/4850aef2-6ab8-407b-ad6d-139b3aedac8f";
  boot.initrd.luks.devices."luks-4850aef2-6ab8-407b-ad6d-139b3aedac8f".keyFile = "/crypto_keyfile.bin";

   # Enable networking
  networking = {
    hostName = "ryzen"; # Define your hostname.
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

  # Configure X11
  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "azerty";

    # Autologin
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
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vinetos = {
    isNormalUser = true;
    description = "Vinetos";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" ];
    packages = with pkgs; [];
  };
  
  # Hardware deamon 
  services.fwupd.enable = true;
 
  # Disable sound when using PipeWire, it seems to cause conflicts
  sound.enable = false;
  security.rtkit.enable = true;
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
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.ssh.startAgent = true;
  programs.git.enable = true;
  programs.git.lfs.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8888 8889 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
