{ flake
, config
, pkgs
, lib
, ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  environment.systemPackages = [ pkgs.git ];

  nixpkgs.overlays = lib.attrValues self.overlays;

  # Configure Nix
  nix = {
    package = pkgs.nixVersions.latest; # Get latest version to enable flakes
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

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
