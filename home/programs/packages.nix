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
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    maven
    opentofu
    typst
    typst-live

    # Productivity
    flameshot
    xfce.thunar
    (pkgs.discord.override {
      #withOpenASAR = true;
      withVencord = true;
    })
    termius

    # Fun
    spotify
  ];
}
