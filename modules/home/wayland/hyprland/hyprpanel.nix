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
      margin_top = "0.1em";

      theme.bar = {
        floating = true;
        buttons = {
          enableBorders = true;
          y_margins = "0.0em";
          padding_y = "0.2em";
          workspaces.enableBorder = false;
        };
        border.location = "none";
        border_radius = "0.4em";
        outer_spacing = "0.0em";
        scaling = 75;
        transparent = true;
      };

      bar = {
        launcher.autoDetectIcon = true;
        workspaces = {
          show_numbered = true;
          show_icons = false;
          workspaceMask = false;
        };
      };
    };
  };

}
