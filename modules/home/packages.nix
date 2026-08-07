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
    zip
    unzip
    gnupg
    tldr # TLDR for man

    # utils
    file

    # Nix dev
    nil # Nix language server
    nix-info
    nixpkgs-fmt

    # Tools
    networkmanagerapplet
    yubikey-personalization
    k9s
    openstackclient-full

    # Dev
    git-review
    opentofu
    packer
    uv
    python3
    kchat-desktop

    # Kube
    kubectl
    kubectl-node-shell
    fluxcd
    tilt
    cilium-cli
    go
    golangci-lint
    gnumake
    gcc
    kubernetes-helm
    jetbrains.goland
    kubespy
    clusterctl
    kubie

    # Productivity
    nautilus
    (discord.override {
      #withOpenASAR = true;
      withVencord = true;
    })

    # Fun
    spotify
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
    fzf.enable = false; # Replaced by atuin
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
  };
}
