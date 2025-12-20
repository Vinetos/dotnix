# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, lib, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  # Enable home-manager for "vinetos" user
  home-manager.users."vinetos" = {
    imports = [ (self + /configurations/home/vinetos.nix) ];
  };

  # TODO: Move this to be shared with other config
  users.users.vinetos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  nixpkgs.config.allowUnfree = true;

  # We must have steam to download wallpaper engine assets
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
}
