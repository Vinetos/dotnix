{ color }:

{
  type = "internal/xwindow";

  format = "<label>";
  format-background = color.shades."2";
  format-padding = 1;

  label = "%title%";
  label-maxlen = 30;

  label-empty = "Desktop";
  label-empty-foreground = color.foreground-alt;
}
