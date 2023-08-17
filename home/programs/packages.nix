{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Tools
    pavucontrol
    networkmanagerapplet
    thunderbird
    blueberry

    # Dev
    maven
    jdk
    jd-gui
    jetbrains.idea-ultimate
    poetry

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ];
    })

    # Productivity
    flameshot
    xfce.thunar
    discord
    termius
    postman
    parsec-bin

    # Fun
    spotify
  ];
}