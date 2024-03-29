{ ... }:
let
  gaps = ''
    general {
        gaps_in = 2
        gaps_out = 5
        border_size = 3
        col.active_border = rgb(8be9fd) rgb(ff79c6) 45deg
        col.inactive_border = rgb(6272a4)
    }
  '';

  decoration = ''
    decoration {
      rounding = 5

      drop_shadow = yes
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)

      active_opacity = 1.0
      inactive_opacity = 0.9

      blur {
        enabled = true
        size = 5
        passes = 1
        ignore_opacity = false
      }
    }
  '';
  animations = ''
      animations {
        enabled = yes

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }
  '';
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    ${gaps}
    ${decoration}
    ${animations}
  '';

}
