{ pkgs, lib, ... }:

let
  mainMod = ''$mainMod = SUPER'';
  applicationsShortcuts =
      let
        term = "${pkgs.alacritty}/bin/alacritty";
        dmenu = "${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
        betterlockscreen = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
        flameshot = "${pkgs.flameshot}/bin/flameshot gui";
        light = "${pkgs.light}/bin/light";
        alsa = "${pkgs.alsa-utils}/bin/amixer -q sset Master";
        playerctl = "${pkgs.playerctl}/bin/playerctl";
      in
      ''
        bind = $mainMod, Return, exec, ${term}
        bind = $mainMod, D, exec, ${dmenu}
        bind = $mainMod, L, exec, ${betterlockscreen}
        bind = , PRINT, exec, ${flameshot}

        bind = , XF86MonBrightnessDown, exec, ${light} -U 5
        bind = , XF86MonBrightnessUp, exec, ${light} -A 5

        bind = , XF86AudioRaiseVolume, exec, ${alsa} 1%+
        bind = , XF86AudioLowerVolume, exec, ${alsa} 1%-
        bind = , XF86AudioMute, exec, ${alsa} toggle

        bind = , XF86AudioPlay, exec, ${playerctl} play-pause
        bind = , XF86AudioPause, exec, ${playerctl} play-pause
        bind = , XF86AudioNext, exec, ${playerctl} next
        bind = , XF86AudioPrev, exec, ${playerctl} previous

      '';

  workspaceControl = ''
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
  '';

  windowControl = ''
    bind = $mainMod SHIFT, Q, killactive
    bind = $mainMod, F, fullscreen
    bind = $mainMod, Space, togglefloating

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
  '';

  gaps = ''
    general {
        gaps_in = 2
        gaps_out = 0
        border_size = 0
        layout = dwindle
    }
  '';

  general = let
    waybar = "${pkgs.waybar}/bin/waybar";
    in ''
    monitor=eDP-1, preferred, auto, 1
    monitor=, preferred, auto, 1

    input {
      kb_layout = us
      kb_variant = intl
    }

  '';
in {
  enable = true;

  plugins = [];

  extraConfig = ''
    ${mainMod}
    ${workspaceControl}
    ${windowControl}
    ${applicationsShortcuts}
    ${gaps}
    ${general}
  '';
}
