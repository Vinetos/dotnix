{
  inputs = {
    self.submodules = true;

    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-unified.url = "github:srid/nixos-unified";

    # Custom inputs
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim/";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Software inputs
    infomanixak.url = ./inputs/infomanix;
    orca.url = "github:Vinetos/orca-cli";
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
