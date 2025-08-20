{ ... }:
let
  wallpaper = builtins.fetchurl {
    url = "https://images.hdqwalls.com/wallpapers/minimal-waterfall-in-mountains-scenery-beautiful-5k-4a.jpg";
    sha256 = "1cwm05w56ydjfm0ah5d7mrza8nj1n4a494anq6hsssdb3jhs7fgh";
  };
in
{

  services.hyprpaper.settings = {
    preload = wallpaper;
    wallpaper = ",${wallpaper}";
  };
}
