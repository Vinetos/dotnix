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
    jetbrains.clion
    poetry
    bun
    ungoogled-chromium

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ];
    })

    # Productivity
    flameshot
    xfce.thunar
    (pkgs.discord.override {
      #withOpenASAR = true;
      withVencord = true;
    })
    termius
    postman
    parsec-bin

    # Fun
    spotify
  ];
}
