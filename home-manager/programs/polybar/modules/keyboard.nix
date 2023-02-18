{ color }:

{
  type = "internal/xkeyboard";

  blacklist-0 = "num lock";
  blacklist-1 = "scroll lock";

  format = "<label-layout> <label-indicator>";
  format-prefix = " ";
  format-prefix-font = 2;
  format-background = color.shades."7";
  format-padding = 1;

  label-layout = " %layout%";

  label-indicator-on = "%name%";
  label-indicator-on-foreground = color.foreground;
}
