# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    plymouth = {
      enable = true;
      theme = "deus_ex";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "deus_ex" ];
        })
      ];
    };

    # Silent boot
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-4850aef2-6ab8-407b-ad6d-139b3aedac8f".device =
    "/dev/disk/by-uuid/4850aef2-6ab8-407b-ad6d-139b3aedac8f";
  boot.initrd.luks.devices."luks-4850aef2-6ab8-407b-ad6d-139b3aedac8f".keyFile =
    "/crypto_keyfile.bin";

  # Enable networking
  networking = {
    hostName = "ryzen"; # Define your hostname.
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

  # Configure console keymap
  console.keyMap = "us";

  # Hardware deamon
  services.fwupd.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    kitty
  ];

  # Enable PCSCD for smart card
  services.pcscd.enable = true;

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
