{ color }:

{
  type = "internal/alsa";
  
  master-soundcard = "default";
  speaker-soundcard = "default";
  headphone-soundcard = "default";

  master-mixer = "Master";

  interval = 5;

  format-volume = "<ramp-volume> <label-volume>";
  format-volume-background = color.shades."5";
  format-volume-padding = 2;

  format-muted = "<label-muted>";
  format-muted-prefix = " ";
  format-muted-prefix-font = 2;
  format-muted-background = color.shades."5";
  format-muted-padding = 2;

  label-volume = "%percentage%%";

  label-muted = " Muted";
  label-muted-foreground = color.foreground;

  ramp-volume-0 = " ";
  ramp-volume-1 = " ";
  ramp-volume-2 = " ";
  ramp-volume-font = 2;

  ramp-headphones-0 = " ";
}
