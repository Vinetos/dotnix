{ config
, inputs
, lib
, pkgs
, ...
}:
let
  wallpaper = builtins.fetchurl rec {
    name = "wallpaper.jpg";
    url = "https://github.com/Vinetos/dotnix/blob/main/home/wallpaper.jpg?raw=true";
    sha256 = "0ybw1lppilx2ds5b941y4y54iawl1lkipwqrswwp088yh2ascmzs";
  };
in
{

  home.packages = with pkgs; [ hyprpaper ];

  # Generate mandatory config file https://github.com/hyprwm/hyprpaper/issues/87
  home.file.".config/hypr/hyprpaper.conf".text = ''
    ipc = on
    preload  = ${wallpaper}
    wallpaper = eDP-1,${wallpaper}
  '';

  # Start hyprpaper deamon
  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.hyprpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
