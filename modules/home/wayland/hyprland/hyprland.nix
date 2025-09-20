{ lib
, config
, pkgs
, default
, ...
}:
let
  # TODO: Rewrite this file to use nix language now that hyprland HM module update is merged.
  mainMod = "SUPER";

  # Packages
  cliphist = "${lib.getExe pkgs.cliphist}";
  hyprshot = "${lib.getExe pkgs.hyprshot}";
  grim = "${lib.getExe pkgs.grim}";
  kitty = "${lib.getExe pkgs.kitty}";
  light = "${lib.getExe pkgs.light}";
  notify-send = "${lib.getExe pkgs.libnotify}";
  playerctl = "${lib.getExe pkgs.playerctl}";
  rofi = "${lib.getExe pkgs.rofi}";
  slurp = "${lib.getExe pkgs.slurp}";
  swaylock-effects = "${lib.getExe pkgs.swaylock-effects}";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy"; # wl-clipboard expose multiple binaries
  wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
  wtype = "${lib.getExe pkgs.wtype}"; # Allow pasting to gui application by simulating keyboard inputs

  # Shortcuts
  clipboard = {
    paste = "${cliphist} list | ${rofi} -dmenu -theme ~/.config/rofi/themes/clipboard/config.rasi | ${cliphist} decode | ${wl-copy} && ${wtype} -M ctrl v -m ctrl";
    wipe = ""; # "${cliphist} wipe && ${notify-send} \"Cleared clipboard\"";
  };

  applicationsShortcuts =
    let
      term = "${kitty}";
      dmenu = "${rofi} -modi drun -show drun -show-icons";
      swaylock = "${swaylock-effects} -S";
      screenshot = "${hyprshot} -m region --freeze --output-folder ~/Pictures/";
    in
    ''
      bind = $mainMod, Return, exec, ${term}
      bind = $mainMod, D, exec, ${dmenu}
      bind = $mainMod, L, exec, ${swaylock}
      bind = , PRINT, exec, ${screenshot}
      bind = $mainMod SHIFT, S, exec, ${screenshot}

      binde = , XF86MonBrightnessDown, exec, ${light} -U 5
      binde = , XF86MonBrightnessUp, exec, ${light} -A 5

      binde = , XF86AudioRaiseVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 1%+
      binde = , XF86AudioLowerVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 1%-
      bindl = , XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle

      bindl = , XF86AudioPlay, exec, ${playerctl} play-pause
      bindl = , XF86AudioPause, exec, ${playerctl} play-pause
      bindl = , XF86AudioNext, exec, ${playerctl} next
      bindl = , XF86AudioPrev, exec, ${playerctl} previous

    '';

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
  '';
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    ${workspaceControl}
    ${compositorControls}
    ${applicationsShortcuts}
    ${general}
  '';

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = mainMod;
    general = {
      layout = "hy3";
    };
    # Exec configuration
    exec-once = [
      "${wl-paste} --type text --watch ${cliphist} store" # cliphist retains only text inputs
    ];
    bind = [
      # Clipboard
      "CTRL SHIFT, V, exec, ${clipboard.paste}"
      "$mainMod SHIFT, V, exec, ${clipboard.wipe}"
    ];
  };
}
