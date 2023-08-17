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
  ];

  homeImports = {
    "vinetos@framework" =
      sharedModules
      ++ desktopModules
      ++ [ ./framework ];
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
    });
  };
}