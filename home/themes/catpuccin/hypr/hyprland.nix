# Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
#
# Theme Elements & Colors for Hyprland.
# Edited for Garuda Linux by yurihikari
# Edited by Vinetos for its personal config
{ ... }:
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
    "$inactive_border_col_1" = "1e2030";
    "$inactive_border_col_2" = "1e2030";
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
      cursor_inactive_timeout = 30;
      no_cursor_warps = false;
      apply_sens_to_raw = false;
    };

    # Decoration
    decoration = {
      rounding = "$hypr_rounding";
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;
      drop_shadow = true;
      shadow_range = 10;
      shadow_render_power = 3;
      "col.shadow" = "$active_shadow_col";
      "col.shadow_inactive" = "$inactive_shadow_col";
      shadow_scale = 1.0;
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
