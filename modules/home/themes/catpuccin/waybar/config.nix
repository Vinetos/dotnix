{ config
, lib
, pkgs
, default
, ...
}:
{

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      mode = "dock";
      position = "top";
      height = 25;
      margin = "4";
      spacing = 4;

      # "fixed-center": false

      modules-left = [
        "custom/padd"
        "hyprland/workspaces"
        "hyprland/submap"
        "custom/separator"
        "group/right-group"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "tray"
        "privacy"
        "custom/separator"
        "custom/separator"
        "backlight"
        "custom/separator"
        "pulseaudio"
        "battery"
        "custom/separator"
        "network"
        "custom/padd"
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

      "custom/padd" = {
        return-type = "text";
        interval = "once";
        format = " ";
        tooltip = false;
      };

      "custom/separator" = {
        return-type = "text";
        interval = "once";
        format = "·";
        tooltip = false;
      };

      "hyprland/submap" = {
        format = "<span style=\"italic\">{}</span>";
      };

      "tray" = {
        icon-size = 14;
        spacing = 8;
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
        "interval" = 5;
        "format" = "CPU:{usage}%";
        "format-icons" = {
          "default" = [ "󰍛" ];
        };
      };

      disk = {
        path = "/";
        interval = 5;
        format = "DISK={used}";
        format-icons = {
          default = [ "󰋊" ];
        };
        tooltip = true;
      };

      "memory" = {
        "interval" = 5;
        "format" = "RAM={used}GB";
        "format-used" = "{used} GB";
        "format-total" = "{total} GB";
        "format-icons" = {
          "default" = [ "󰘚" ];
        };
        "tooltip" = true;
        "tooltip-format" =
          "Used= {used}GB\nAvailable= {avail}GB\nTotal= {total}GB\nPercentage= {percentage}%";
      };

      "temperature" = {
        format = "  {temperatureC}°C";
        critical-threshold = 80;
      };

      "backlight" = {
        device = "{icon} {percent: >3}%";
        format = "{percent}% {icon}";
        format-icons = [
          "󰃞"
          "󰃟"
          "󰃠"
        ];
      };

      "battery" = {
        full-at = 96;
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-time = "{H}h {M}m";
        format-icons = [
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
        states = {
          good = 96;
          ok = 77;
          warning = 30;
          critical = 15;
        };
      };

      "network" = {
        format = "⚠  Disabled";
        format-wifi = "  {essid}";
        format-ethernet = "  {ifname}: {ipaddr}/{cidr}";
        format-disconnected = "⚠  Disconnected";
        max-length = 50;
      };

      "pulseaudio" = {
        format = "{icon} {volume: >3}%";
        format-bluetooth = "{icon} {volume: >3}%";
        format-muted = "";
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

      "privacy" = {
        "icon-spacing" = 4;
        "icon-size" = 15;
        "transition-duration" = 250;
        "modules" = [
          {
            "type" = "screenshare";
            "tooltip" = false;
            "tooltip-icon-size" = 15;
          }
          {
            "type" = "audio-out";
            "tooltip" = false;
            "tooltip-icon-size" = 15;
          }
          {
            "type" = "audio-in";
            "tooltip" = false;
            "tooltip-icon-size" = 15;
          }
        ];
      };

      "hyprland/language" = {
        format = "  {short}";
      };

      "custom/cogicon" = {
        format = "󰒔 ";
      };

      "group/right-group" = {
        orientation = "inherit";
        drawer = {
          "icon-spacing" = 4;
          "icon-size" = 15;
          "format" = "󰒻";
          "click-to-reveal" = true;
          "transition-duration" = 400;
          "transition-left-to-right" = true;
        };
        "modules" = [
          "custom/cogicon"
          "cpu"
          "memory"
          "custom/gpu1"
          "custom/gpu2"
          "disk"
        ];
      };
    };
  };
}
