{ ... }:
let
  wallpaper = builtins.fetchurl {
    url = "https://i.redd.it/52bb00rh254d1.jpeg";
    sha256 = "00bvb43sindbcvbbznv9y2var1xx5qr5yz1iccx7jgalf5w0l56q";
  };
in
{
  
  services.hyprpaper.settings = {
    preload  = wallpaper;
    wallpaper = ",${wallpaper}";
  };
}
