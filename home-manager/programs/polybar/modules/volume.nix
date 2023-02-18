{ color, bar, ...}:

{
  type = "internal/alsa";
  master-soundcard = "default";
  speaker-soundcard = "default";
  headphone-soundcard = "default";

  master-mixer = "Master";

  interval = 5;

  format-volume = "<ramp-volume> <bar-volume>";
  format-volume-background = color.shades."6";
  format-volume-padding = 2;

  format-muted = "<label-muted>";
  format-muted-prefix = "";
  format-muted-prefix-font = 2;
  format-muted-background = color.shades."6";
  format-muted-padding = 2;

  label-volume = "%percentage%%";

  label-muted = " Muted";
  label-muted-foreground = color.foreground;

  ramp-volume-0 = "";
  ramp-volume-1 = "";
  ramp-volume-2 = "";
  ramp-volume-font = 2;

  ramp-headphones-0 = "";
  
  bar-volume-width = 10;
  bar-volume-gradient = false;

  bar-volume-indicator = bar.indicator;
  bar-volume-indicator-foreground = color.foreground;

  bar-volume-fill = bar.fill;
  bar-volume-foreground-0 = color.foreground;
  bar-volume-foreground-1 = color.foreground;
  bar-volume-foreground-2 = color.foreground;

  bar-volume-empty = bar.empty;
  bar-volume-empty-foreground = color.foreground;
}
