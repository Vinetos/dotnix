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
    jetbrains.idea-ultimate
    poetry
    terraform
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
