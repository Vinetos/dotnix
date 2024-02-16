{ inputs
, self
, withSystem
, sharedModules
, desktopModules
, homeImports
, ...
}: {
  flake.nixosConfigurations = withSystem "x86_64-linux" ({ system, ... }: {
    framework = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules =
        [

          inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
          ./framework
          ../modules/doas.nix
          ../modules/xserver.nix
          ../modules/hyprland.nix
          ../modules/security.nix
          ../modules/desktop.nix

          { home-manager.users.vinetos.imports = homeImports."vinetos@framework"; }
        ]
        ++ sharedModules
        ++ desktopModules;
    };
    xps = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules =
        [

          # inputs.nixos-hardware.nixosModules.framework-12th-gen-intel TODO: DO MR on nix-hardware for XPS 15 9570
          ./xps
          ../modules/doas.nix
          ../modules/xserver.nix
          ../modules/hyprland.nix
          ../modules/security.nix
          ../modules/desktop.nix
          ../modules/clamav.nix

          { home-manager.users.vinetos.imports = homeImports."vinetos@xps"; }
        ]
        ++ sharedModules
        ++ desktopModules;
    };
  });
}
