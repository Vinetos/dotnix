{
  config,
  lib,
  pkgs,
  default,
  ...
}:
{

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      margin-top = 5;

      # "fixed-center": false

      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "custom/swap"
        "tray"
        "hyprland/submap"
        "custom/cava-internal"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "backlight"
        "pulseaudio"
        "hyprland/language"
        "temperature"
        "memory"
        "battery"
        "network"
        "custom/power"
      ];

      "hyprland/workspaces" = {
        # Enable scroll in workspaces modules
        format = "{icon}";
        sort-by-number = true;
        active-only = false;
        on-scroll-up = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e+1";
        on-scroll-down = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e-1";
        on-click = "activate";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          urgent = "";
          focused = "";
          default = "";
        };
      };

      "custom/swap" = {
        on-click = "";
        tooltip = "Swap between waybar configs";
        format = "Bg  ";
      };

      "custom/cava-internal" = {
        exec = "${lib.getExe pkgs.cava} | ${lib.getExe pkgs.gnused} -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'";
        format = "{}";
        tooltip = false;
        on-click = "";
        output = "all";
      };

      "hyprland/submap" = {
        format = "<span style=\"italic\">{}</span>";
      };

      "tray" = {
        icon-size = 14;
        spacing = 5;
      };

      "clock" = {
        format = "  {:%d/%m/%Y  %H:%M}";
        format-alt = "  {:%d/%m/%Y  %H:%M:%S}";
        interval = 1;
        tooltip-format = "<tt><small>{calendar}</small></tt>";

        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          on-click-right = "mode";
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            days = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      "cpu" = {
        format = "﬙ {usage: >3}%";
      };

      "memory" = {
        format = " {: >3}%";
      };

      "temperature" = {
        format = "  {temperatureC}°C";
        critical-threshold = 80;
      };

      "backlight" = {
        device = "{icon} {percent: >3}%";
        format = "{percent}% {icon}";
        format-icons = [
          ""
          ""
        ];
      };

      "battery" = {
        format = "{icon} {capacity: >3}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        states = {
          warning = 30;
          critical = 15;
        };
      };

      "network" = {
        format = "⚠  Disabled";
        format-wifi = "  {essid}";
        format-ethernet = " {ifname}: {ipaddr}/{cidr}";
        format-disconnected = "⚠  Disconnected";
        max-length = 50;
      };

      "pulseaudio" = {
        scroll-step = 1;
        format = "{icon} {volume: >3}%";
        format-bluetooth = "{icon} {volume: >3}%";
        format-muted = " muted";
        format-icons = {
          headphones = "";
          handsfree = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [
            ""
            ""
          ];
        };
        on-click = "pavucontrol";
      };

      "custom/power" = {
        format = "⏻";
        on-click = ""; # TODO: https://github.com/yurihikari/garuda-sway-config/blob/b8200b562c1ce23731261401f1352d912281cf30/hypr/scripts/rofi_powermenu
        tooltip = false;
      };

      "hyprland/language" = {
        format = "  {short}";
      };

      "custom/launcher" = {
        format = " ";
        on-click = ""; # TODO: https://github.com/yurihikari/garuda-sway-config/blob/b8200b562c1ce23731261401f1352d912281cf30/hypr/scripts/rofi_launcher
        tooltip = false;
      };
    };
  };
}
