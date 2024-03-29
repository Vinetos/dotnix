{ ... }:
let
  wallpaper = builtins.fetchurl {
    url = "https://github.com/Vinetos/dotnix/blob/main/home/themes/catpuccin/backgrounds/deer.jpg?raw=true";
    sha256 = "1494bkhakk72xk8hcy1mw7b1m6rr4bda3aspblz6ml6325fx796x";
  };
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload  = ${wallpaper}
    wallpaper = ,${wallpaper}
  '';
}
