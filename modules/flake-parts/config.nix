# Top-level configuration for everything in this repo.
#
# Values are set in 'config.nix' in repo root.
{ lib, ... }:
let
  freeformOption = lib.mkOption {
    type =
      with lib.types;
      let
        valueType =
          nullOr (oneOf [
            bool
            int
            float
            str
            path
            (attrsOf valueType)
            (listOf valueType)
          ])
          // {
            description = "Freeform configuration";
          };
      in
      valueType;
  };
  themeSubmodule = lib.types.submodule {
    options = {
      colors = freeformOption;
      xcolors = freeformOption;
      rgbaColors = freeformOption;

      wallpaper = lib.mkOption {
        type = lib.types.submodule {
          options = {
            url = lib.mkOption {
              type = lib.types.str;
              description = ''
                URL to wallpaper image.
              '';
            };
            sha256 = lib.mkOption {
              type = lib.types.str;
              description = ''
                sha256 hash of wallpaper image.
              '';
            };
          };
        };
      };
    };
  };
in
{
  imports = [
    # ../../config.nix
    ../../lib/theme
  ];
  options.theme = lib.mkOption {
    type = themeSubmodule;
  };
}
