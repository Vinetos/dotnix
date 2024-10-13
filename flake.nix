{
  description = "Vinetos NixOS Flakes configurations";

  inputs = # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages
      dev.url = "github:matthewpi/nixpkgs/zen-browser"; # My dev version

      flake-parts = {
        url = "github:hercules-ci/flake-parts";
        inputs.nixpkgs-lib.follows = "nixpkgs";
      };

      nixos-hardware.url = "github:Vinetos/nixos-hardware/master";
      nixos-wsl.url = "github:nix-community/NixOS-WSL";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland.url = "github:hyprwm/Hyprland?ref=v0.44.0&submodules=1";

      hy3 = {
        url = "github:outfoxxed/hy3?ref=hl0.44.0";
        inputs.hyprland.follows = "hyprland";
      };
    };

  outputs = inputs@{ self, nixpkgs, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./home/profiles
        ./hosts
        ./lib
        ./modules
        { config._module.args._inputs = inputs // { inherit (inputs) self; }; }
      ];
    };

}
