{ pkgs, colors }: # Inspired from Colorblocks by Aditya Shakya @adi1090x https://github.com/adi1090x/polybar-themes/blob/master/simple/colorblocks

let
    # todo: Import from a global colorscheme
  color = {
    background = "#141C21";
    foreground = "#F5F5F5";
    foreground-alt = "#FFFFFF";
    alpha = "#222";

    shades = colors.shades;
 
  };
 
  bar = {
    fill = "";
    empty = "";
    indicator = "⏽";
  };

  # Network Interfaces
  interface = {
    wired = "enp2s0";
    wireless = "wlp166s0";
  };

in
  {
    enable = true;
  
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
    };
    
    script = "PATH=$PATH:${pkgs.i3}/bin polybar main &";
  
    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };


      "bar/main" = {
          
        override-redicrect = false;

        fixed-center = true;

        width = "100%";
        height = 30;

        offset-x = "0%";
        offset-y = "1%";

        background = color.alpha;
        foreground = color.foreground;


        radius-top = 0;
        radius-bottom = 0;

        underline-size = 2;
        underline-color = color.foreground;

        border-size = 0;
        border-color = color.background;

        padding = 0;

        module-margin-left = 0;
        module-margin-right = 0;

        font-0 = "Iosevka Nerd Font:pixelsize=10;3";
        font-1 = "Iosevka Nerd Font:style=Medium:size=13;3.9";

        modules-left = "workspaces";
        modules-center = "title";
        modules-right = "keyboard network alsa battery date";

        separator = "";

        dim-value = "1.0";

        tray-position = "none";
        tray-detached = false;
        tray-maxsize = 16;
        tray-background = color.background;
        tray-offset-x = 0;
        tray-offset-y = 0;
        tray-padding = 0;
        tray-scale = "1.0";

        enable-ipc = true;

      };
    
      "settings" = {
        screenchange-reload = true;

        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";

        pseudo-transparency = "false";
      };

      # Modules
      # "module/volume" = import ./modules/volume.nix { inherit bar color; };
      # "module/brightness" = import ./modules/brightness.nix { inherit bar color; };
      # "module/alsa" = import ./modules/alsa.nix { inherit bar color; };
      # "module/backlight" = import ./modules/backlight.nix { inherit bar color; };
      "module/battery" = import ./modules/battery.nix { inherit color; };
      "module/cpu" = import ./modules/cpu.nix { inherit color; };
      "module/date" = import ./modules/date.nix { inherit color; };
      "module/alsa" = import ./modules/alsa.nix { inherit color; };
      "module/keyboard" = import ./modules/keyboard.nix { inherit color; };
      "module/sep" = import ./modules/sep.nix { inherit color; };
      "module/title" = import ./modules/title.nix { inherit color; };
      "module/workspaces" = import ./modules/workspaces.nix { inherit color;};
      # TODO: Share these properties
      "module/wired-network" = { type = "internal/network"; interface = interface.wired; };
      "module/wireless-network" = { type = "internal/network"; interface = interface.wireless; };
      "module/network" = import ./modules/network.nix { inherit color interface; };

     # Bars
     # "module/battery_bar" = import ./bars/battery_bar.nix { inherit bar color; };
     # "module/cpu_bar" = import ./bars/cpu_bar.nix { inherit bar color; };
    };
  }
