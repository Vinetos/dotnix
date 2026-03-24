{
  inputs = {
    self.submodules = true;

    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-unified.url = "github:srid/nixos-unified";

    # Custom inputs
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1&ref=v0.54.2";
    };
    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.54.2";
      inputs.hyprland.follows = "hyprland";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim/";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Software inputs
    infomanixak.url = ./inputs/infomanix;
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # Openstack-nix
    #openstack-nix.url = "path:///home/vinetos/Documents/Perso/openstack-nix";
  };

  # Wired using https://nixos-unified.org/autowiring.html
  outputs =
    inputs:
    inputs.nixos-unified.lib.mkFlake {
      inherit inputs;
      root = ./.;
    };
}
