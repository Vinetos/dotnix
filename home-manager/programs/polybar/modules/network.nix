{ color, interface }:

{
    type = "internal/network";
    interface = interface.wireless;

    unknown-as-up = true;

    format-connected = "<label-connected>";
    format-connected-prefix = " ";
    format-connected-prefix-font = 2;
    format-connected-background = color.shades."6";
    format-connected-padding = 2;

    format-disconnected = "<label-disconnected>";
    format-disconnected-prefix = "ﲁ";
    format-disconnected-prefix-font = 2;
    format-disconnected-background = color.shades."6";
    format-disconnected-padding = 2;

    label-connected = "%{A1:networkmanager_dmenu &:} %essid%%{A}";
    label-disconnected = "%{A1:networkmanager_dmenu &:} Offline%{A}";

  }
