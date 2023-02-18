{ pkgs, colors }:

{
  enable = true;

  settings = {
    live_config_reload = true;

    window = {
      title = "Terminal";
      opacity = 0.7;
    };


    font = {
      normal.family = "Fira Code Nerd Font";
      normal.style = "Regular";
      size = 10.0;
    };

    cursor.style = "Underline";

    shell = {
      program = "${pkgs.fish}/bin/fish";
      args = [ "--init-command" "echo; neofetch --disable packages; echo" ];
    };

    colors = {
      primary = {
        background = colors.dark.black;
        foreground = colors.dark.white;
      };
      cursor = {
        text   = "0xFF261E";
        cursor = "0xFF261E";
      };
      normal = {
        black   = colors.dark.black;
        red     = colors.dark.red;
        green   = colors.dark.green;
        yellow  = colors.dark.yellow;
        blue    = colors.dark.blue;
        magenta = colors.dark.magenta;
        cyan    = colors.dark.cyan;
        white   = colors.dark.white;
      };
      bright = {
        black   = colors.light.black;
        red     = colors.light.red;
        green   = colors.light.green;
        yellow  = colors.light.yellow;
        blue    = colors.light.blue;
        magenta = colors.light.magenta;
        cyan    = colors.light.cyan;
        white   = colors.light.white;
      };
    };
  };
}
