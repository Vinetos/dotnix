{ pkgs, ... }:

{
  enable = true;
  interactiveShellInit = ''
    set NIX_PATH "$NIX_PATH:nixpkgs-overlays=/etc/nixos/overlays"
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';
  
  shellAbbrs = {
      # Nix
      ns = "nix shell nixpkgs#";
      nr = "sudo nixos-rebuild switch --flake /etc/nixos/#(hostname)";
      nu = "nix flake update";
      ngc = "sudo nix-collect-garbage -d";
      # Other
      cat = "bat -p";
      man = "tldr";
  };

  shellAliases = {
    mkdir = "mkdir -p";
  };
}
