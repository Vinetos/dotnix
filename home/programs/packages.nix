{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Tools
    pavucontrol
    networkmanagerapplet
    thunderbird
    blueberry
    yubikey-personalization
    etcher


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
