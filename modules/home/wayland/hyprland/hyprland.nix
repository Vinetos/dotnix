{
  lib,
  config,
  pkgs,
  default,
  ...
}:
let
  # TODO: Rewrite this file to use nix language now that hyprland HM module update is merged.
  mainMod = "SUPER";

  # Packages
  dms-ipc = "dms ipc call";
  playerctl = "${lib.getExe pkgs.playerctl}";
  cliphist = "${lib.getExe pkgs.cliphist}";
  kitty = "${lib.getExe pkgs.kitty}";
  wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
in
{
  wayland.windowManager.hyprland.settings = {
    # Elements
    "$hypr_border_size" = "2";
    "$hypr_gaps_in" = "5";
    "$hypr_gaps_out" = "10";
    "$hypr_rounding" = "10";

    # Colors
    "$gradient_angle" = "45deg";
    "$active_border_col_1" = "0xFFB4A1DB";
    "$active_border_col_2" = "0xFFD04E9D";
    "$inactive_border_col_1" = "rgb(1e2030)";
    "$inactive_border_col_2" = "rgb(1e2030)";
    "$active_shadow_col" = "0x66000000";
    "$inactive_shadow_col" = "0x66000000";
    "$group_border_col" = "0xFFDB695B";
    "$group_border_active_col" = "0xFF4BC66D";

    "$mainMod" = mainMod;
    input = {
      kb_layout = "us";
      kb_variant = "intl";
      follow_mouse = 1; # Cursor movement will always change focus to the window under the cursor.
      numlock_by_default = true;
    };
    # General
    general = {
      layout = "hy3";
      border_size = "$hypr_border_size";
      gaps_in = "$hypr_gaps_in";
      gaps_out = "$hypr_gaps_out";
      "col.active_border" = "$active_border_col_1 $active_border_col_2 $gradient_angle";
      "col.inactive_border" = "$inactive_border_col_1 $inactive_border_col_2 $gradient_angle";
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };
    # Exec configuration
    exec-once = [
      "${wl-paste} --watch ${cliphist} store &"
    ];
    bind = [
      # General
      "$mainMod SHIFT, Q, killactive"
      "$mainMod SHIFT, E, exec, poweroff"
      "$mainMod, F, fullscreen"
      "$mainMod, Space, togglefloating"

      # Hy3
      "$mainMod, H, hy3:makegroup, h"
      "$mainMod, V, hy3:makegroup, v"

      "$mainMod, left, hy3:movefocus, l"
      "$mainMod, right, hy3:movefocus, r"
      "$mainMod, up, hy3:movefocus, u"
      "$mainMod, down, hy3:movefocus, d"

      # Resize submap
      "$mainMod, R, submap, resize"

      # Application Launchers
      "$mainMod, Return, exec, ${kitty}"
      "$mainMod, D, exec, ${dms-ipc} spotlight toggle"
      "$mainMod, N, exec, ${dms-ipc} notifications toggle"
      "$mainMod, TAB, exec, ${dms-ipc} hypr toggleOverview"

      # Security
      "$mainMod, L, exec, ${dms-ipc} lock lock"

      # Clipboard
      "CTRL SHIFT, V, exec, ${dms-ipc} clipboard toggle"

      # Screenshot
      " , PRINT, exec, dms screenshot"
      "$mainMod SHIFT, S, exec, dms screenshot"

      # Workspaces
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ]
    # Workspaces (part-2)
    # binds mainMod + [shift +] {1..9} to [move to] ws {1..9}
    ++ lib.flatten (
      map (
        n:
        let
          ws = toString n;
        in
        [
          "$mainMod, ${ws}, workspace, ${ws}"
          "$mainMod SHIFT, ${ws}, movetoworkspacesilent, ${ws}"
        ]
      ) (builtins.genList (x: x + 1) 9)
    );
    # e : Will repeat when held.c
    binde = [
      # Move window
      "$mainMod SHIFT, left, hy3:movewindow, l"
      "$mainMod SHIFT, right, hy3:movewindow, r"
      "$mainMod SHIFT, up, hy3:movewindow, u"
      "$mainMod SHIFT, down, hy3:movewindow, d"
      # When floating
      "$mainMod SHIFT, left, moveactive, -30 0"
      "$mainMod SHIFT, right, moveactive, 30 0"
      "$mainMod SHIFT, up, moveactive, 0 -30"
      "$mainMod SHIFT, down, moveactive, 0 30"
    ];
    # l : Will also work when an input inhibitor (e.g. a lockscreen) is active.
    bindel = [
      # Audio Controls
      " , XF86AudioRaiseVolume, exec, ${dms-ipc} audio increment 1"
      " , XF86AudioLowerVolume, exec,  ${dms-ipc} audio decrement 1"

      # Brightness Controls
      " , XF86MonBrightnessUp, exec,  ${dms-ipc} brightness increment 5 \"\""
      " , XF86MonBrightnessDown, exec,  ${dms-ipc} brightness decrement 5 \"\""
    ];
    bindl = [
      " , XF86AudioMute, exec, ${dms-ipc} audio mute"
      " , XF86AudioPlay, exec, ${playerctl} play-pause"
      ", XF86AudioPause, exec, ${playerctl} play-pause"
      " , XF86AudioNext, exec, ${playerctl} next"
      " , XF86AudioPrev, exec, ${playerctl} previous"
    ];
    # m: Mouse bind
    bindm = [
      "$mainMod, mouse:272, hy3:movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Decoration
    decoration = {
      rounding = "$hypr_rounding";
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 10;
        color = "$active_shadow_col";
        color_inactive = "$inactive_shadow_col";
        render_power = 3;
        scale = 1.0;
      };
      dim_inactive = false;
      dim_strength = 0.5;
    };

    # Animation
    animations = {
      enabled = true;
      animation = [
        "windowsIn, 1, 5, default, popin 0%"
        "windowsOut, 1, 5, default, popin"
        "windowsMove, 1, 5, default, slide"
        "fadeIn, 1, 8, default"
        "fadeOut, 1, 8, default"
        "fadeSwitch, 1, 8, default"
        "fadeShadow, 1, 8, default"
        "fadeDim, 1, 8, default"
        "border, 1, 10, default"
        "workspaces, 1, 5, default, slide"
      ];
    };

    # Monitors configuration
    # name, resolution, position, scale
    monitors = [
      # Home's screens
      "desc:Dell Inc. DELL S2722DGM G98HZ83, 2560x1440@165.08Hz, 0x0, 1"
      "desc:Dell Inc. DELL S2721HGF 1BFFS83, 1920x1080@144.00Hz, auto-center-left, 1"
      # Framework laptop
      "desc:BOE 0x095F, prefered, auto, 1"
      # Default rule for all monitors1
      ", preferred, auto, 1"
    ];

    windowrule = [
      # idle inhibit while watching videos
      "idle_inhibit focus, match:class ^(mpv|.+exe)$"
      "idle_inhibit focus, match:class ^(firefox)$, match:title ^(.*YouTube.*)$"
      "idle_inhibit fullscreen, match:class ^(firefox)$"

      # Opacity for inactive windows
      "opacity 0.95 0.95, match:float 0, match:focus 0"

      # GNOME apps
      "rounding 12, border_size 0, match:class ^(org\.gnome\.)"

      # Terminal apps - no borders
      "border_size 0, match:class ^(org\.wezfurlong\.wezterm)$"
      "border_size 0, match:class ^(Alacritty)$"
      "border_size 0, match:class ^(zen)$"
      "border_size 0, match:class ^(com\.mitchellh\.ghostty)$"
      "border_size 0, match:class ^(kitty)$"

      # Floating windows
      "float on, match:class ^(gnome-calculator)$"
      "float on, match:class ^(blueman-manager)$"
      "float on, match:class ^(org\.gnome\.Nautilus)$"

      # Open DMS windows as floating by default
      "float on, match:class ^(org.quickshell)$"
    ];
  };

  wayland.windowManager.hyprland.submaps.resize.settings = {
    binde = [
      ", left, resizeactive, -10 0"
      ", right, resizeactive, 10 0"
      ", up, resizeactive, 0 -10"
      ", down, resizeactive, 0 10"
    ];

    bind = [
      ", escape, submap, reset"
    ];

  };
}
