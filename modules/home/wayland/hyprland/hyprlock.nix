{
  lib,
  config,
  pkgs,
  default,
  ...
}:
let
  lock = builtins.fetchurl {
    url = "https://images.hdqwalls.com/wallpapers/firewatch-minimal-jx.jpg";
    sha256 = "1d0kpq8l5bnzaawgy2cdr7pir4q36b75rl95s5jd0lz5q5aqyznn";
  };
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        grace = 2;
      };

      # ─────────── BACKGROUND ───────────
      background = {
        monitor = "";
        path = lock;
        blur_size = 16;
        blur_passes = 4;
        noise = 0.0;
        contrast = 0.95;
        brightness = 0.94;
        vibrancy = 0.22;
      };

      # ─────────── CLOCK & DATE ───────────
      label = [
        # Hour XXL (19:51)
        {
          monitor = "";
          text = "cmd[update:1000] date +'%H:%M'";
          font_family = "Maple Mono NF";
          font_size = 96;
          position = "0, 260"; # ↑ haut
          halign = "center";
          valign = "center";
          color = "rgba(255,255,255,0.96)";
          shadow_passes = 1;
        }
        # Date (XXXX • 18 sept)
        {
          monitor = "";
          text = "cmd[update:60000] LC_TIME=fr_FR.UTF-8 date +'%A • %e %B'";
          font_family = "Maple Mono NF";
          font_size = 22;
          position = "0, 180";
          halign = "center";
          valign = "center";
          color = "rgba(255,255,255,0.75)";
        }
        # Username
        {
          monitor = "";
          text = "$USER";
          font_family = "Maple Mono NF";
          font_size = 22;
          position = "0, -110";
          halign = "center";
          valign = "center";
          color = "rgba(255,255,255,0.85)";
          shadow_passes = 1;
        }

        # Fine separator
        {
          monitor = "";
          text = "────────────";
          font_family = "Maple Mono NF";
          font_size = 14;
          position = "0, -133";
          halign = "center";
          valign = "center";
          color = "rgba(168,177,255,0.30)";
        }
      ];

      # ─────────── AVATAR ───────────
      image = {
        monitor = "";
        path = builtins.fetchurl {
          url = "https://avatars.githubusercontent.com/u/10145351";
          sha256 = "sha256:1ia9w427ihsdyyxwrnhf19a62w57350h1dym73biz2zb6cnc9k4k";
        };
        size = 180;
        rounding = 180;
        border_size = 2;
        border_color = "rgba(168,177,255,0.45)";
        position = "0, 20";
        halign = "center";
        valign = "center";
        shadow_passes = 1;
      };

      # ─────────── INPUT ───────────
      "input-field" = {
        monitor = "";
        size = "460, 56";
        position = "0, -200";
        halign = "center";
        valign = "center";

        rounding = 18;
        outline_thickness = 2;

        # verre + thème
        inner_color = "rgba(12,18,28,0.26)";
        outer_color = "rgba(168,177,255,0.35)";
        font_color = "rgba(255,255,255,1.0)";

        # placeholder (Pango markup)
        placeholder_text = "Password";

        font_family = "Maple Mono NF";
        dots_center = true;
        fade_on_empty = false;

        fail_color = "rgba(255,95,95,0.95)";
        check_color = "rgba(160,255,160,0.98)";
      };
    };
  };
}
