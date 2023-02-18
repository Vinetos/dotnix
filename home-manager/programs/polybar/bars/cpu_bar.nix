{ color, bar, ...}:

{
  type = "internal/cpu";
  internal = "0.5";

  format = "<bar-load> <label>";
  format-prefix = "﬙ ";
  format-prefix-font = 2;
  format-background = color.shades."7";
  format-padding = 2;

  label = "%percentage%%";

  bar-load-width = 10;
  bar-load-gradient = false;

  bar-load-indicator = bar.indicator;
  bar-load-indicator-foreground = color.foreground;

  bar-load-fill = bar.fill;
  bar-load-foreground-0 = color.foreground;
  bar-load-foreground-1 = color.foreground;
  bar-load-foreground-2 = color.foreground;

  bar-load-empty = bar.empty;
  bar-load-empty-foreground = color.foreground;
}
