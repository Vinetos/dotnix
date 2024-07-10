{ pkgs
, config
, lib
, inputs
, ...
}:
# configuration shared by all hosts
{
  environment.systemPackages = [ ];

  # Set your time zone.
  time.timeZone = lib.mkDefault "Europe/Paris";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    # Prevent installing all glibc supported locales
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "fr_FR.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
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
  };

  networking.networkmanager = {
    enable = true;
  };

  # pickup pkgs from flake export
  nixpkgs.pkgs = import inputs.nixpkgs {
    system = config.nixpkgs.system;
    config.allowUnfree = true;
  };
  nixpkgs.overlays = [
    (self: prev: {
      # Shortcut to call packages from unstable (pkgs.unstable.hello)
      unstable = import inputs.unstable {
        system = prev.system;
        config.allowUnfree = true;
      };
      # Shotcut to call packages from dev inputs (pkgs.dev.hello)
      dev = import inputs.dev {
        system = prev.system;
        config.allowUnfree = true;
      };
    })
  ];

  users.users.vinetos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "docker"
      "libvirtd"
    ];
    shell = pkgs.fish;
  };

  programs = {
    command-not-found.enable = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    fish.enable = true;
  };

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;

    # Hardware deamons
    fwupd.enable = true;

  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = lib.mkDefault "24.05"; # Did you read the comment?
}
