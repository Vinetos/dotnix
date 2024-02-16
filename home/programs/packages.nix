{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Tools
    pavucontrol
    networkmanagerapplet
    thunderbird
    blueberry
    yubikey-personalization

    # Dev
    maven
    jdk21
    jd-gui
    jetbrains.idea-ultimate
    jetbrains.clion
    poetry
    bun
    ungoogled-chromium
    terraform

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
    rustdesk

    # Fun
    spotify
  ];
}
