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

  workspaceControl = ''
    # workspaces
    # binds mainMod + [shift +] {1..10} to [move to] ws {1..10}
    ${builtins.concatStringsSep "\n" (
      builtins.genList (
        x:
        let
          ws =
            let
              c = (x + 1) / 10;
            in
            builtins.toString (x + 1 - (c * 10));
        in
        ''
          bind = $mainMod, ${ws}, workspace, ${toString (x + 1)}
          bind = $mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
        ''
      ) 10
    )}

    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
  '';

  compositorControls = ''
    bind = $mainMod SHIFT, Q, killactive
    bind = $mainMod SHIFT, E, exec, poweroff

    bind = $mainMod, F, fullscreen
    bind = $mainMod, Space, togglefloating

    bindm = $mainMod, mouse:272, hy3:movewindow
    bindm = $mainMod, mouse:273, resizewindow

    # hy3 groups
    bind = $mainMod, H, hy3:makegroup, h
    bind = $mainMod, V, hy3:makegroup, v

    # move focus
    bind = $mainMod, left, hy3:movefocus, l
    bind = $mainMod, right, hy3:movefocus, r
    bind = $mainMod, up, hy3:movefocus, u
    bind = $mainMod, down, hy3:movefocus, d

    # move window
    binde = $mainMod SHIFT, left, hy3:movewindow, l
    binde = $mainMod SHIFT, right, hy3:movewindow, r
    binde = $mainMod SHIFT, up, hy3:movewindow, u
    binde = $mainMod SHIFT, down, hy3:movewindow, d
    # When floating
    binde = $mainMod SHIFT, left, moveactive, -30 0
    binde = $mainMod SHIFT, right, moveactive, 30 0
    binde = $mainMod SHIFT, up, moveactive, 0 -30
    binde = $mainMod SHIFT, down, moveactive, 0 30

    # window resize
    bind = $mainMod, R, submap, resize

    submap = resize
    binde = , right, resizeactive, 10 0
    binde = , left, resizeactive, -10 0
    binde = , up, resizeactive, 0 -10
    binde = , down, resizeactive, 0 10
    bind = , escape, submap, reset
    submap = reset
  '';

  general = ''
    monitor=eDP-1, preferred, auto, 1
    monitor=, preferred, auto, 1

    input {
      kb_layout = us
      kb_variant = intl
      follow_mouse = 1 # Cursor movement will always change focus to the window under the cursor.
      numlock_by_default = true
    }

    # idle inhibit while watching videos
    windowrulev2 = idleinhibit focus, class:^(mpv|.+exe)$
    windowrulev2 = idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$
    windowrulev2 = idleinhibit fullscreen, class:^(firefox)$

    # Fixing popup size issue
    windowrule = size 50% 50%, class:(.*jetbrains.*)$, title:^$,floating:1

    # Fix tooltips (always have a title of `win.<id>`)
    windowrule = noinitialfocus, class:^(.*jetbrains.*)$, title:^(win.*)$
    windowrule = nofocus, class:^(.*jetbrains.*)$, title:^(win.*)$

    # Fix tab dragging (always have a single space character as their title)
    windowrule = noinitialfocus, class:^(.*jetbrains.*)$, title:^\\s$
    windowrule = nofocus, class:^(.*jetbrains.*)$, title:^\\s$

    # Danklinux
    layerrule = noanim, ^(dms)$
    # Opacity for inactive windows
    windowrulev2 = opacity 0.95 0.95, floating:0, focus:0

    # GNOME apps
    windowrulev2 = rounding 12, class:^(org\.gnome\.)
    windowrulev2 = noborder, class:^(org\.gnome\.)

    # Terminal apps - no borders
    windowrulev2 = noborder, class:^(org\.wezfurlong\.wezterm)$
    windowrulev2 = noborder, class:^(Alacritty)$
    windowrulev2 = noborder, class:^(zen)$
    windowrulev2 = noborder, class:^(com\.mitchellh\.ghostty)$
    windowrulev2 = noborder, class:^(kitty)$

    # Floating windows
    windowrulev2 = float, class:^(gnome-calculator)$
    windowrulev2 = float, class:^(blueman-manager)$
    windowrulev2 = float, class:^(org\.gnome\.Nautilus)$

    # Open DMS windows as floating by default
    windowrulev2 = float, class:^(org.quickshell)$
  '';
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    ${general}
    ${workspaceControl}
    ${compositorControls}
  '';

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = mainMod;
    general = {
      layout = "hy3";
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
    ];
    # l : Will also work when an input inhibitor (e.g. a lockscreen) is active.
    # e : Will repeat when held.c
    bindel = [
      # Audio Controls
      " , XF86AudioRaiseVolume, exec, ${dms-ipc} audio increment 1"
      " , XF86AudioLowerVolume, exec,  ${dms-ipc} audio decrement 1"

      # Brightness Controls
      " , XF86MonBrightnessUp, exec,  ${dms-ipc} brightness increment 5"
      " , XF86MonBrightnessDown, exec,  ${dms-ipc} brightness decrement 5"
    ];
    bindl = [
      " , XF86AudioMute, exec, ${dms-ipc} audio mute"
      " , XF86AudioPlay, exec, ${playerctl} play-pause"
      ", XF86AudioPause, exec, ${playerctl} play-pause"
      " , XF86AudioNext, exec, ${playerctl} next"
      " , XF86AudioPrev, exec, ${playerctl} previous"
    ];
  };

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

    # General
    general = {
      border_size = "$hypr_border_size";
      no_border_on_floating = false;
      gaps_in = "$hypr_gaps_in";
      gaps_out = "$hypr_gaps_out";
      "col.active_border" = "$active_border_col_1 $active_border_col_2 $gradient_angle";
      "col.inactive_border" = "$inactive_border_col_1 $inactive_border_col_2 $gradient_angle";
    };

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
  };
}
