{ ... }:
let
  wallpaper = builtins.fetchurl {
    url = "https://github.com/Vinetos/dotnix/blob/main/home/themes/darcula/backgrounds/wallpaper.jpg?raw=true";
    sha256 = "0ybw1lppilx2ds5b941y4y54iawl1lkipwqrswwp088yh2ascmzs";
  };
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload  = ${wallpaper}
    wallpaper = ,${wallpaper}
    # test 3
  '';
}
