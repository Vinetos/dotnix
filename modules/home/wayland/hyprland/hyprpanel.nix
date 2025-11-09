{
  lib,
  config,
  pkgs,
  default,
  ...
}:
{
  programs.hyprpanel = {
    enable = true; # Configuration goes here
    settings = {
      menus.clock.weather = {
        location = "Geneva";
        unit = "metric";
      };

      theme.bar = {
        floating = true;
        buttons.enableBorders = true;
        border.location = "none";
        border_radius = "0.4em";
        outer_spacing = "0.5em";
      };
    };
  };

}
