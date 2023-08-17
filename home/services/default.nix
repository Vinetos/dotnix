{ config, ... }: {
  imports = [
    ./gpg-agent.nix
    ./picom.nix
  ];
}
