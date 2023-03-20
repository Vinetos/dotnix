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
    gnupg
    netcat
    tree
    libnotify
    pywal
    gitAndTools.gitflow
    git-lfs
    curl
    docker-compose
    nodejs
    jq
    kaf
    glab
    wireguard-tools
    bat # cat(1) on pills
    tldr # Better than man
    postgresql

     # Tools
    pavucontrol
    arandr
    networkmanagerapplet

    # Dev
    maven
    jdk
    jd-gui
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.gateway
    jetbrains.datagrip
    poetry

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ];
    })

    # Productivity
    flameshot
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    firefox-devedition-bin
    discord
    termius

    # Fun
    spotify
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
    picom = import ./programs/picom/picom.nix;
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
