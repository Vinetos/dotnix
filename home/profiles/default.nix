{ inputs
, self
, withSystem
, module_args
, ...
}:
let
  sharedModules = [
    ../.
    ../shells
    module_args
  ];

  desktopModules = with inputs; [
    hyprland.homeManagerModules.default
    ../wayland
  ];

  homeImports = {
    "vinetos@framework" =
      sharedModules
      ++ desktopModules
      ++ [ ./framework ];

    "vinetos@xps" =
      sharedModules
      ++ desktopModules
      ++ [ ./xps ];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in
{
  imports = [
    { _module.args = { inherit homeImports; }; }
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({ pkgs, ... }: {
      "vinetos@framework" = homeManagerConfiguration {
        modules = homeImports."vinetos@framework" ++ module_args;
        inherit pkgs;
      };
      "vinetos@xps" = homeManagerConfiguration {
        modules = homeImports."vinetos@xps" ++ module_args;
        inherit pkgs;
      };
    });
  };
}
