{ inputs, pkgs, ... }:

{
  imports = [
  ];

  nixpkgs.config.allowUnfree = true;

  wsl = {
    enable = true;

    wslConf.automount.root = "/mnt";
    wslConf.network.hostname = "wsl";

    defaultUser = "vinetos";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = true;
    nativeSystemd = true; # Support WSL2 systemd
  };

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "23.05";
}
