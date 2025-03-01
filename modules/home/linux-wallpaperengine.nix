# Enable linux wallpaper engine for linux
# Install Steam and download Wallpaper Engine
# Change this configuration to match wallpaper id and assets directory
{ config, pkgs, ... }:
{
  services.linux-wallpaperengine = {
    enable = true;
    assetsPath = "/home/vinetos/.local/share/Steam/steamapps/common/wallpaper_engine/assets/";
    clamping = "border";

    wallpapers = [
      {
         monitor = "eDP-1";
         wallpaperId = "1373816444";
         #scaling = "fit"; # "stretch" "fit" "fill" "default" 
       }
    ];
  };

  # Add env variable for wayland
  systemd.user.services."linux-wallpaperengine" = {
    environment = {
      XDG_SESSION_TYPE="wayland"; 
      DISPLAY=":0";
    };  
    Service.Environment = "XDG_SESSION_TYPE=wayland DISPLAY=:0";
  };
}
