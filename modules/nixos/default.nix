# This is your nixos configuration.
# For home configuration, see /modules/home/*
{
  flake,
  pkgs,
  lib,
  ...
}:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

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

  # These users can add Nix caches.
  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

  # Enable the OpenSSH service on every NixOS
  services.openssh.enable = true;
  # Enable the fwupd service on every NixOS
  services.fwupd.enable = true;
}
