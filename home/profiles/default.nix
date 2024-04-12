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
    {
      wayland.windowManager.hyprland.plugins = [ inputs.hy3.packages.x86_64-linux.hy3 ]; # TODO: Move me in hyprland config file
    }
    ../wayland
  ];

  homeImports = {
    "vinetos@framework" =
      sharedModules
      ++ desktopModules
      ++ [ ./framework ]
      ++ [ ../themes/catpuccin ];
    #      ++ [ ../themes/darcula ];

    "vinetos@xps" =
      sharedModules
      ++ desktopModules
      ++ [ ./xps ]
      ++ [ ../themes/catpuccin ];
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
