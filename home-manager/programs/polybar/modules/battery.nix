{ color, ...}:

let
  # Find theses names with 
  # $ ls -1 /sys/class/power_supply/
  # Remove the suffix @
  battery_name = "BAT1";
  battery_adapter = "ADP1";
in
  {
    type = "internal/battery";

    # This is useful in case the battery never reports 100% charge
    full-at = "99";

    battery = battery_name;
    adapter = battery_adapter;

    poll-interval = 2;

    time-format = "%H:%M";

    format-charging = "<animation-charging> <label-charging>";
    format-charging-background = color.shades."4";
    format-charging-padding = 1;

    format-discharging = "<ramp-capacity> <label-discharging>";
    format-discharging-background = color.shades."4";
    format-discharging-padding = 1;

    format-full = "<label-full>";
    format-full-prefix = "  ";
    format-full-background = color.shades."4";
    format-full-padding = 1;


    label-charging = "%percentage%%";
    label-discharging = "%percentage%%";
    label-full = "Full";

    ramp-capacity-0 = "  ";
    ramp-capacity-1 = "  ";
    ramp-capacity-2 = "  ";
    ramp-capacity-3 = "  ";
    ramp-capacity-4 = "  ";

    animation-charging-0 = "  ";
    animation-charging-1 = "  ";
    animation-charging-2 = "  ";
    animation-charging-3 = "  ";
    animation-charging-4 = "  ";

    animation-charging-framerate = 750;

  }
