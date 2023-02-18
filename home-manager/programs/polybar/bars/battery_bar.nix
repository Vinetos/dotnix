{ color, bar, ...}:

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

    format-charging = "<bar-capacity>";
    format-charging-prefix = " ";
    format-charging-prefix-font = 2;
    format-charging-background = color.shades."5";
    format-charging-padding = 2;

    format-discharging = "<bar-capacity>";
    format-discharging-prefix = " "; 
    format-discharging-prefix-font = 2;
    format-discharging-background = color.shades."5";
    format-discharging-padding = 2;

    format-full = "<label-full>";
    format-full-prefix = " ";
    format-full-prefix-font = 2;
    
    format-full-background = color.shades."5";
    format-full-padding = 2;


    label-charging = "%percentage%%";
    label-discharging = "%percentage%%";
    label-full = "Full";

    bar-capacity-width = 10;
    bar-capacity-gradient = false;

    bar-capacity-indicator = bar.indicator;
    bar-capacity-indicator-foreground = color.foreground;

    bar-capacity-fill = bar.fill;
    bar-capacity-foreground-0 = color.foreground;
    bar-capacity-foreground-1 = color.foreground;
    bar-capacity-foreground-2 = color.foreground;

    bar-capacity-empty = bar.empty;
    bar-capacity-empty-foreground = color.foreground;
  }
