{ pkgs, ... }:
{
  imports = [
    ./hypr
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    #nerdfonts
    font-awesome
  ];
}
