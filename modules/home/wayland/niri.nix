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

  #
  dms-ipc = "dms ipc call";
  playerctl = "${lib.getExe pkgs.playerctl}";

  toNiri = str: lib.splitString " " str;

  # Hyprland-like numbered workspaces: Mod+{1..9,0} to focus, Mod+Shift+{1..9,0} to move.
  wsRange = lib.range 1 10;
  wsKey = n: if n == 10 then "0" else toString n;

  # Workspaces are declared 1..10 in the config file. niri prepends each named
  # workspace (insert at position 0), so the runtime order is the reverse of the
  # declaration order; binds below therefore target workspaces by positional
  # index, which is what the bar displays.
  namedWorkspaces = lib.listToAttrs (
    map (n: {
      name = lib.fixedWidthString 2 "0" (toString n);
      value.name = toString n;
    }) wsRange
  );

  # `focus = false` moves without switching, like Hyprland's movetoworkspacesilent.
  workspaceBinds = lib.listToAttrs (
    lib.concatMap (n: [
      {
        name = "Mod+${wsKey n}";
        value.action.focus-workspace = n;
      }
      {
        name = "Mod+Shift+${wsKey n}";
        value.action.move-column-to-workspace = [
          { focus = false; }
          n
        ];
      }
    ]) wsRange
  );
in
{
  # Configure niri
  programs.niri.settings = {
    workspaces = namedWorkspaces;

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
          variant = "intl,fr";
        };
      };
    };
    binds = {
      "Mod+Return".action.spawn = "${lib.getExe pkgs.kitty}";
      "Mod+D".action.spawn = toNiri "${dms-ipc} spotlight toggle";

      "Mod+L".action.spawn = toNiri "${dms-ipc} lock lock";
      "Mod+Shift+Q".action.close-window = { };
      "Mod+Shift+E".action.spawn = toNiri "${dms-ipc} powermenu toggle";
      "Mod+Shift+P".action.power-off-monitors = { };

      "Ctrl+Shift+V".action.spawn = toNiri "${dms-ipc} clipboard toggle";
      "Mod+Shift+S".action.spawn = toNiri "${dms-ipc} niri screenshot";
      "PRINT".action.spawn = toNiri "${dms-ipc} niri screenshot";

      # Focus controls
      "Mod+Up".action.focus-window-up = { };
      "Mod+Down".action.focus-window-down = { };
      "Mod+Left".action.focus-column-left = { };
      "Mod+Right".action.focus-column-right = { };
      "Mod+space".action.toggle-window-floating = { };

      # Move controls
      "Mod+Shift+Down".action.move-window-down = { };
      "Mod+Shift+Left".action.consume-or-expel-window-left = { };
      "Mod+Shift+Right".action.consume-or-expel-window-right = { };
      "Mod+Shift+Up".action.move-window-up = { };

      # Column controls
      "Mod+H".action.switch-preset-column-width = { };
      "Mod+V".action.switch-preset-window-height = { };
      "Mod+F".action.maximize-column = { };

      # Audio Controls
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = toNiri "${dms-ipc} audio increment 1";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = toNiri "${dms-ipc} audio decrement 1";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = toNiri "${dms-ipc} audio mute";
      };
      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn = toNiri "${playerctl} play-pause";
      };
      "XF86AudioPause" = {
        allow-when-locked = true;
        action.spawn = toNiri "${playerctl} play-pause";
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn = toNiri "${playerctl} next";
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn = toNiri "${playerctl} previous";
      };

      # Brightness Controls
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = toNiri "${dms-ipc} brightness increment 5 ";
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = toNiri "${dms-ipc} brightness decrement 5 ";
      };
    }
    // workspaceBinds;
    environment = {
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      NIXOS_OZONE_WL = "1";
      ELM_DISPLAY = "wl";
      SDL_VIDEODRIVER = "wayland";
    };
    layout = {
      # Selected heights and widhts when cycling
      preset-window-heights = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
        { proportion = 1.; }
      ];
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
        { proportion = 1.; }
      ];
    };

  };
}
