{
  description = "Vinetos NixOS Flakes configurations";

  inputs = # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05"; # Nix Packages
      unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable version
      dev.url = "github:Vinetos/nixpkgs/octaviaclient"; # My dev version

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

      hyprland = {
        url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=v0.41.2";
      };

      hyprland-contrib = {
        url = "github:hyprwm/contrib";
        inputs.nixpkgs.follows = "unstable";
      };

      hy3 = {
        url = "github:outfoxxed/hy3?ref=hl0.41.2";
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
