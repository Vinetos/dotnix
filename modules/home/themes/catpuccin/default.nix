{ pkgs, ... }:
{
  imports = [
    ./hypr
    ./swaylock.nix
    ./waybar
    ./cava.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    nerdfonts
    font-awesome
  ];
}
