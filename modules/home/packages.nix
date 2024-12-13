{ pkgs, ... }:
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
    du-dust
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
    #thunderbird
    blueberry
    yubikey-personalization
    github-copilot-intellij-agent

    # Dev
    git-review
    jdk21
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    maven
    opentofu
    typst
    typst-live
    onlyoffice-bin
    packer
    poetry
    python3

    # Productivity
    flameshot
    xfce.thunar
    (discord.override {
      #withOpenASAR = true;
      withVencord = true;
    })
    termius

    # Fun
    spotify
    upscayl
  ];

  # add environment variables
  home.sessionVariables = {
    # clean up ~
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    EDITOR = "vim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
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
