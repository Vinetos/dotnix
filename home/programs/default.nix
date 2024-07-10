{ config, ... }: {
  imports = [
    ./git.nix
    ./librewolf.nix
    ./nvim.nix
    ./packages.nix
    ./rofi.nix
    ./swaylock.nix
    ./waybar.nix
  ];
}
