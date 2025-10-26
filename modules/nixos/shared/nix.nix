{
  flake,
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  # We install git for flakes
  environment.systemPackages = [ pkgs.git ];

  # We define this module's overlays as overlays for nixpkgs
  nixpkgs = {
    overlays = lib.attrValues self.overlays;
    config.allowUnfree = true;
  };


  # Configure Nix
  nix = {

    # auto garbage collect
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      sandbox = true; # Enable sandboxing for testing packages

      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

    };
  };
}
