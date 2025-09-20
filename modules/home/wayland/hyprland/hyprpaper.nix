{ config
, inputs
, lib
, pkgs
, ...
}:
{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
    };
  };
}
