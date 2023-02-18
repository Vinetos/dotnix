{
  description = "My NixOS Flake Configuration";

  inputs = # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages

      home-manager = { # User Package Management
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:   # Function that tells my flake which to use and what do what to do with the dependencies.
    let                         # Variables that can be used in the config files.
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
        vinetos = lib.nixosSystem {
         inherit system;
          modules = [ 
            ./configuration.nix 

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

