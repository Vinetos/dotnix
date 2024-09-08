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
          ../modules/tailscale.nix

          { home-manager.users.vinetos.imports = homeImports."vinetos@framework"; }
        ]
        ++ sharedModules
        ++ desktopModules;
    };
    ryzen = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules =
        [

          ./ryzen
          ../modules/doas.nix
          ../modules/xserver.nix
          ../modules/hyprland.nix
          ../modules/security.nix
          ../modules/desktop.nix
          ../modules/tailscale.nix

          { home-manager.users.vinetos.imports = homeImports."vinetos@ryzen"; }
        ]
        ++ sharedModules
        ++ desktopModules;
    };
    xps = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules =
        [

          inputs.nixos-hardware.nixosModules.dell-xps-15-9570-nvidia
          ./xps
          ../modules/doas.nix
          ../modules/xserver.nix
          ../modules/hyprland.nix
          ../modules/security.nix
          ../modules/desktop.nix
          ../modules/clamav.nix
          ../modules/tailscale.nix
          ../modules/vpn.nix

          { home-manager.users.vinetos.imports = homeImports."vinetos@xps"; }
        ]
        ++ sharedModules
        ++ desktopModules;
    };
    wsl = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules =
        [
          inputs.nixos-wsl.nixosModules.wsl
          ./wsl
          ../modules/doas.nix
          ../modules/security.nix
          ../modules/tailscale.nix

          { home-manager.users.vinetos.imports = homeImports."vinetos@wsl"; }
        ]
        ++ sharedModules;
    };
  });
}
