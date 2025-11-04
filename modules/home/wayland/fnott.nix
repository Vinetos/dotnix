{
  flake,
  lib,
  pkgs,
  ...
}:
let
  inherit (flake.config.theme) xcolors;
in
{

  services.fnott = {
    enable = true;
    # https://github.com/catppuccin/fnott/blob/main/themes/catppuccin-latte.ini
    settings = {
      critical = {
        border-color = "f5a97fff";
      };
      main = {
        title-color = "a5adcbff";
        summary-color = "cad3f5ff";
        body-color = "cad3f5ff";
        background = "24273aff";
        border-color = "8aadf4ff";
        progress-bar-color = "6e738dff";
      };
    };
  };
}
