{
  description = "Vinetos NixOS Flake configurations";

  inputs = # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages

      nixos-hardware.url = "github:NixOS/nixos-hardware/master";
      nixos-wsl.url = "github:nix-community/NixOS-WSL";

      home-manager = { # User Package Management
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland = {
        url = "github:hyprwm/Hyprland";
      };
    };

  outputs = inputs @ { self, nixpkgs, nixos-hardware, nixos-wsl, home-manager, hyprland,... }:   # Function that tells my flake which to use and what do what to do with the dependencies.
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

        # TODO: Compact this ?
        framework = lib.nixosSystem {
         inherit system;
          modules = [
            hyprland.nixosModules.default
            nixos-hardware.nixosModules.framework-12th-gen-intel
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
        wsl = lib.nixosSystem {
         inherit system;
          modules = [
            nixos-wsl.nixosModules.wsl
            ./wsl/configuration.nix
            
           home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vinetos = {
                imports = [ ./home-manager/home.nix ];
              };
              home-manager.extraSpecialArgs = { inherit inputs system; };
            }
          ];
        };
      };
    };
}

