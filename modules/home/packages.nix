{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    zip
    unzip
    gnupg
    tldr # TLDR for man

    # utils
    file
    dust
    duf
    fd

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt

    # Dev
    tmate

    # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
    # work.
    less

    # Tools
    pavucontrol
    networkmanagerapplet
    blueberry
    yubikey-personalization
    k9s

    # Dev
    git-review
    jdk21
    jetbrains.idea
    jetbrains.pycharm
    maven
    opentofu
    typst
    typst-live
    onlyoffice-desktopeditors
    packer
    poetry
    uv
    python3
    go
    #linphone

    # Productivity
    flameshot
    xfce.thunar
    (discord.override {
      #withOpenASAR = true;
      withVencord = true;
    })

    # Fun
    spotify
    upscayl
  ];

  # add environment variables
  home.sessionVariables = {
    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    EDITOR = "vim";
    MANPAGER = "bat -l man -p";
  };

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    # Better `cat`
    bat.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
  };
}
