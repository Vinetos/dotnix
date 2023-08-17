{ config, ... }: {
  imports = [
    ./git.nix
    ./nvim.nix
    ./packages.nix
    ./rofi.nix
  ];
}
