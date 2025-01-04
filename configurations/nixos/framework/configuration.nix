# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "framework"; # Define your hostname.
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 vinetos.local
    '';
    firewall.checkReversePath = false;
  };

  # Configure console keymap
  console.keyMap = "us";

  #nixpkgs.overlays = import ../overlays;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    firefox
    kitty # for Hyprland
  ];

  # Configure X11 and Wayland
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "intl";
  };

  # Enable PCSCD for smart card
  services.pcscd.enable = true;

  # Digital
  services.fprintd.enable = true;

  # Disable Power Button
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?=
}
