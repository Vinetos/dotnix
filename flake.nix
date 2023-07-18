{
  description = "Vinetos NixOS Flake configurations";

  inputs = # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages

      home-manager = { # User Package Management
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland = {
        url = "github:hyprwm/Hyprland";
      };
    };

  outputs = inputs @ { self, nixpkgs, home-manager, hyprland,... }:   # Function that tells my flake which to use and what do what to do with the dependencies.
    let
      user = "vinetos";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = { # NixOS configurations
        framework = lib.nixosSystem {
         inherit system;
          modules = [
            hyprland.nixosModules.default
            ./framework/configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vinetos = {
                imports = [
                  hyprland.homeManagerModules.default
                  ./home-manager/home.nix
                ];
              };
              home-manager.extraSpecialArgs = { inherit inputs system; };
            }
          ];
        };
        ryzen = lib.nixosSystem {
         inherit system;
          modules = [
            ./ryzen/configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vinetos = {
                imports = [ ./home-manager/home.nix ];
              };
            }
          ];
        };
      };
    };
}

