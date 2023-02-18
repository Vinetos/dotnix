{ color, ...}:

{
  type = "internal/cpu";
  internal = 1;

  format = "<label>";
  format-prefix = " ";
  format-prefix-font = 2;
  format-background = color.shades."8";
  format-foreground = color.foreground;
  format-padding = 2;

  label = " %percentage%%";
}
