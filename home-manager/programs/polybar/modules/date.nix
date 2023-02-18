{ color, ...}:

{
  type = "internal/date";
  internal = "1.0";

  time = " %I:%M %p";
  time-alt = " %a, %d %b %Y";

  format = "<label>";
  format-prefix = " ";
  format-font = 2;
  format-background = color.shades."3";
  format-foreground = color.foreground;
  format-padding = 2;

  label = "%time%";
}
