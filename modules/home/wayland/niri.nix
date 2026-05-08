{
  flake,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
let
  cursor = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
in
{
  # Configure niri
  programs.niri.settings = {
    input = {
      # Focus windows and outputs automatically when moving the mouse into them.
      # Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
      focus-follows-mouse.enable = true;
      focus-follows-mouse.max-scroll-amount = "0%";
      warp-mouse-to-focus.enable = true;
      keyboard = {
        numlock = true;
        xkb = {
          layout = "us,ch";
          variant = "intl,";
        };
      };
    };
    binds = {
      "Mod+Return".action.spawn = "${lib.getExe pkgs.kitty}";
      "Mod+D".action.spawn = lib.splitString " " "dms ipc call spotlight toggle";
      "Ctrl+Shift+V".action.spawn = lib.splitString " " "dms ipc call clipboard toggle";
      "Mod+L".action.spawn = lib.splitString " " "dms ipc call lock lock";
    };
    environment = {
      XDG_CURRENT_DESKTOP = "niri";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "gtk3";
      T_QPA_PLATFORMTHEME_QT6 = "gtk3";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
  };
}
