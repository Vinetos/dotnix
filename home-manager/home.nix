{ inputs, system, config, pkgs, lib, ...}:

let
  username = "vinetos"; # My username
  colors = import ./colorschemes.nix; # Custom colorscheme
  github-copilot-intellij-agent = pkgs.callPackage ./programs/github-copilot-intellij-agent/default.nix {};
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
    libnotify
    pywal
    gitAndTools.gitflow
    git-lfs
    docker-compose
    nodejs
    glab
    bat # cat(1) on pills
    tldr # Better than man
    github-copilot-intellij-agent

     # Tools
    pavucontrol
    arandr
    networkmanagerapplet
    thunderbird

    # Dev
    maven
    jdk
    jd-gui
    jetbrains.idea-ultimate
    jetbrains.rider
    poetry
    dotnet-sdk_6

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ];
    })

    # Productivity
    flameshot
    xfce.thunar
    discord
    termius
    postman

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
    waybar = import ./programs/waybar { inherit inputs system pkgs; };
  };

  services = {
    picom = import ./programs/picom/picom.nix;
    polybar = import ./programs/polybar/polybar.nix { inherit pkgs colors; };
    gpg-agent = import ./programs/gpg-agent/gpg-agent.nix;
    betterlockscreen = import ./programs/betterlockscreen/betterlockscreen.nix;
    mako.enable = true;
  };

  xsession.windowManager.i3 = import ./programs/i3/i3.nix {inherit pkgs lib; };
  wayland.windowManager.hyprland = import ./programs/hyprland { inherit pkgs; };

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";
}
