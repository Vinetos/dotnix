{ config
, pkgs
, default
, ...
}:
{

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      margin-top = 5;

      # "fixed-center": false

      modules-left = [ "hyprland/workspaces" "hyprland/window" "hyprland/submap" ];
      modules-center = [ "custom/weather" ];
      modules-right = [ "cpu" "memory" "temperature" "network" "wireplumber" "backlight" "battery" "clock" ];

      "hyprland/workspaces" = {
        # Enable scroll in workspaces modules
        format = "{name}";
        on-scroll-up = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e+1";
        on-scroll-down = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e-1";
        on-click = "activate";
      };

      "custom/weather" = {
        format = "{}";
        interval = 30 * 60; # Every 30 mins
        exec = "${pkgs.curl}/bin/curl wttr.in/?format=1";
      };

      "hyprland/window" = {
        max-length = 30;
      };

      "hyprland/submap" = {
        format = "✌️ {}";
        max-length = 8;
        tooltip = false;
      };

      "cpu" = {
        interval = 5;
        format = "{usage}% ";
        max-length = 10;
      };

      "memory" = {
        interval = 10;
        format = "{}% 󰍛";
        max-length = 10;
      };

      "temperature" = {
        format = "{temperatureC}°C ";
      };

      "backlight" = {
        device = "{intel_backlight}";
        format = "{percent}% {icon}";
        format-icons = [ "" ];
      };

      "battery" = {
        format = "{capacity}% {icon}";
        format-icons = [ "" "" "" "" "" ];
        states = { critical = 20; };
      };

      "clock" = {
        format = "{:%H:%M}  ";
        format-alt = "{:%A, %d %B %Y}  ";
      };

      "wireplumber" = {
        format = "{volume}% {icon}";
        format-muted = "";
        format-icons = [ "" "" "" ];
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };

      "network" = {
        format = "{ifname}";
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        format-disconnected = ""; # An empty format will hide the module.
        tooltip-format = "{ifname} via {gwaddr} ";
        tooltip-format-wifi = "{essid} ({signalStrength}%) ";
        tooltip-format-ethernet = "{ifname} ";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
      };
    };
  };
}
