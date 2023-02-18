{config, pkgs, lib, ...}:

let
  username = "vinetos"; # My username
  colors = import ./colorschemes.nix; # Custom colorscheme
in
{
  imports = [
    ./services/battery.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    # CLI-Tools
    htop
    neofetch
    feh
    gnupg
    netcat
    tree
    yubikey-manager-qt
    any-nix-shell
    nixos-shell
    pandoc
    libnotify
    pywal
    gitAndTools.gitflow
    git-lfs
    curl
    p7zip
    docker-compose
    postgresql
    nodejs
    texlive.combined.scheme-full
    jq
    kaf
    glab
    wireshark
    wireguard-tools
    jetbrains.pycharm-professional
    poetry


     # Tools
    pavucontrol
    arandr
    networkmanagerapplet
    remmina
    postman
    vscodium
    gnome-console
    gnome.gnome-terminal

    # Java
    maven
    jdk
    jd-gui
    jetbrains.idea-ultimate

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ];
    })

    # Productivity
    obsidian
    flameshot
    teams
    xfce.thunar
    firefox-devedition-bin
    discord
    openvpn

    # Fun
    spotify

    # Game
    minecraft
  ];

  fonts.fontconfig.enable = true;

  # Programs and services configurations
  programs = {
    home-manager.enable = true;
    neovim = import ./programs/nvim/nvim.nix { inherit pkgs; };
    alacritty = import ./programs/alacritty/alacritty.nix { inherit pkgs colors; };
    rofi = import ./programs/rofi/rofi.nix { inherit config colors; };
    fish = import ./programs/fish/fish.nix { inherit pkgs; };
    starship = import ./programs/starship/starship.nix;
    git = import ./programs/git/git.nix { inherit pkgs; };
  };

  services = {
    #picom = import ./programs/picom/picom.nix;
    polybar = import ./programs/polybar/polybar.nix { inherit pkgs colors; };
    gpg-agent = import ./programs/gpg-agent/gpg-agent.nix;
    betterlockscreen = import ./programs/betterlockscreen/betterlockscreen.nix;
  };

  xsession.windowManager.i3 = import ./programs/i3/i3.nix {inherit pkgs lib; };

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";
}
