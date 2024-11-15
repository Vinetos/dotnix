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
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-sudo";
    shellIntegration.enableBashIntegration = true;
    settings = {
      background_opacity = toString 0.7;

      selection_foreground = xcolors.selection-foreground;
      selection_background = xcolors.selection-background;
      #      confirm_on_window_close = 0;

      url_color = xcolors.cyan;

      inherit (xcolors) foreground background;
    } // lib.filterAttrs (k: v: (builtins.match "color([0-9]|1[0-5])" k) != null) xcolors;
    extraConfig = ''
      copy_on_select yes

      map ctrl+c       copy_and_clear_or_interrupt
      map ctrl+v       paste_from_clipboard
      map shift+insert paste_from_clipboard
    '';
  };
}
