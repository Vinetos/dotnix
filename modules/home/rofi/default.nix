{ config, ... }:
let
  colors = import ./colorschemes.nix; # Custom colorscheme
in
{
  programs.rofi = {
    enable = true;
    theme =
      let
        # Adapted from Ribbon top round
        # by adi1090x (https://github.com/adi1090x/rofi/)
        #
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      # Use `mkLiteral` for string-like values that should show without
      # quotes, e.g.:
      # {
      #   foo = "abc"; => foo: "abc";
      #   bar = mkLiteral "abc"; => bar: abc;
      # };
      {
        "*" = {
          font = "FiraCode Nerd Font Medium 12";

          # TODO: Use global system color

          background = mkLiteral "${colors.shades."1"}";
          background-alt = mkLiteral "${colors.shades."1"}";
          foreground = mkLiteral "${colors.dark.white}";

          border = mkLiteral "${colors.accent}";
          border-alt = mkLiteral "${colors.shades."7"}";

          selected = mkLiteral "${colors.shades."6"}";
          urgent = mkLiteral "#DA4453FF";
        };

        "configuration" = {
          show-icons = mkLiteral "true";
          display-drun = "";
          drun-display-format = "{name}";
          disable-history = mkLiteral "false";
          sidebar-mode = mkLiteral "false";
        };

        "window" = {
          transparency = "real";
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";

          border = mkLiteral "3% 0% 0% 0%";
          border-color = mkLiteral "@border";
          border-radius = mkLiteral "2.5% 0% 0% 0%";

          height = mkLiteral "55.50%";
          width = mkLiteral "45%";
          location = mkLiteral "center";
          x-offset = mkLiteral "0";
          y-offset = mkLiteral "0";
        };

        "prompt" = {
          enabled = mkLiteral "true";
          padding = mkLiteral "0% 1% 0% 0%";
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };

        "entry" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
          placeholder-color = mkLiteral "@foreground";
          expand = mkLiteral "true";
          horizontal-align = mkLiteral "0";
          placeholder = "Search Applications";
          padding = mkLiteral "0.15% 0% 0% 0%";
          blink = mkLiteral "true";
        };

        "inputbar" = {
          children = mkLiteral "[ prompt, entry ]";
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
          expand = mkLiteral "false";
          border = mkLiteral "0% 0.2% 0.3% 0%";
          border-radius = mkLiteral "1.5% 0% 1.5% 0%";
          border-color = mkLiteral "@border-alt";
          margin = mkLiteral "0% 0% 0% 0%";
          padding = mkLiteral "1%";
          position = mkLiteral "center";
        };

        "listview" = {
          background-color = mkLiteral "@background";
          columns = mkLiteral "5";
          spacing = mkLiteral "1%";
          cycle = mkLiteral "false";
          dynamic = mkLiteral "true";
          layout = mkLiteral "vertical";
        };

        "mainbox" = {
          background-color = mkLiteral "@background";
          border = mkLiteral "3% 0% 0% 0%";
          border-radius = mkLiteral "2.5% 0% 0% 0%";
          border-color = mkLiteral "@border-alt";
          children = mkLiteral "[ inputbar, listview ]";
          spacing = mkLiteral "2%";
          padding = mkLiteral "2.5% 2% 2.5% 2%";
        };

        "element" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
          orientation = mkLiteral "vertical";
          border-radius = mkLiteral "0%";
          padding = mkLiteral "2% 0% 2% 0%";
        };

        "element-icon" = {
          background-color = mkLiteral "#00000000";
          text-color = mkLiteral "inherit";
          horizontal-align = mkLiteral "0.5";
          vertical-align = mkLiteral "0.5";
          size = mkLiteral "64px";
          border = mkLiteral "0px";
        };

        "element-text" = {
          background-color = mkLiteral "#00000000";
          text-color = mkLiteral "inherit";
          expand = mkLiteral "true";
          horizontal-align = mkLiteral "0.5";
          vertical-align = mkLiteral "0.5";
          margin = mkLiteral "0.5% 1% 0% 1%";
        };

        "element normal.urgent, element alternate.urgent" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
          border-radius = mkLiteral "1%";
        };

        "element normal.active, element alternate.active" = {
          background-color = mkLiteral "@background-alt";
          text-color = mkLiteral "@foreground";
        };

        "element selected" = {
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@foreground";
          border = mkLiteral "0% 0.2% 0.3% 0%";
          border-radius = mkLiteral "1.5% 0% 1.5% 0%";
          border-color = mkLiteral "@border-alt";
        };

        "element selected.urgent" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
        };

        "element selected.active" = {
          background-color = mkLiteral "@background-alt";
          color = mkLiteral "@foreground";
        };

      };
  };
}
