{ default, lib, pkgs, ... }:
let
  inherit (default) xcolors;
in
{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-sudo";
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = ''
        ${lib.getExe pkgs.fish} --init-command "echo; ${lib.getExe pkgs.neofetch} --disable packages; echo"
      '';
      background_opacity = toString 0.7;

      selection_foreground = xcolors.selection-foreground;
      selection_background = xcolors.selection-background;
      confirm_on_windows_close = 0;

      url_color = xcolors.cyan;

      inherit (xcolors) foreground background;
    } // lib.filterAttrs (k: v: (builtins.match "color([0-9]|1[0-5])" k) != null) xcolors;
    extraConfig = ''
      confirm_os_window_close 0
      copy_on_select yes

      map ctrl+c       copy_and_clear_or_interrupt
      map ctrl+v       paste_from_clipboard
      map shift+insert paste_from_clipboard
    '';
  };
}
