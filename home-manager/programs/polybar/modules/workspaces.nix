{ color }:

{
  type = "internal/i3";

  enable-scroll = false;

  index-sort = true;
  strip-wsnumbers = true;

  format = "<label-state> <label-mode>";

  label-visible-padding = 4;
  
  label-mode = "%mode%";
  label-mode-padding = 4;
  label-mode-background = color.shades."3";	
  label-mode-foreground = color.foreground;

  label-focused = "%name%";
  label-focused-padding = 4;
  label-focused-background = color.shades."5";
  label-focused-underline = color.shades."3";

  label-unfocused = "%name%";
  label-unfocused-padding = 4;
  label-unfocused-background = color.shades."3";
}
