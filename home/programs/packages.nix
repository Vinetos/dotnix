{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Tools
    pavucontrol
    networkmanagerapplet
    thunderbird
    blueberry
    yubikey-personalization


    # Dev
    git-review
    jdk21
    pkgs.unstable.jetbrains.idea-ultimate
    pkgs.unstable.jetbrains.pycharm-professional
    maven
    opentofu
    typst
    typst-live
    onlyoffice-bin
    packer
    poetry

    # Productivity
    flameshot
    xfce.thunar
    (pkgs.unstable.discord.override {
      #withOpenASAR = true;
      withVencord = true;
    })
    termius

    # Fun
    spotify
  ];
}
