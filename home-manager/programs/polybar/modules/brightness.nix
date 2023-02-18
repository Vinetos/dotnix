{ color, bar, ...}:
let
  # Use the following command to list available cards:
  # $ ls -1 /sys/class/backlight/
  # Do not put the ending @
  card = "intel_backlight";
in
  {
    # type = "internal/xbacklight";
    type = "internal/backlight";

    format = "<ramp> <bar>";
    format-background = color.shades."7";
    format-padding = 2;

    label = "%percentage%%";

    ramp-0 = "";
    ramp-1 = "";
    ramp-2 = "";
    ramp-3 = "";
    ramp-4 = "";
    ramp-font = 2;

    bar-width = 10;
    bar-gradient = false;

    bar-indicator = bar.indicator;
    bar-indicator-foreground = color.foreground;

    bar-fill = bar.fill;
    bar-foreground-0 = color.foreground;
    bar-foreground-1 = color.foreground;
    bar-foreground-2 = color.foreground;

    bar-empty = bar.empty;
    bar-empty-foreground = color.foreground;
  }
