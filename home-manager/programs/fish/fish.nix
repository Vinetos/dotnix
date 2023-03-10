{ pkgs, ... }:

{
  enable = true;
  interactiveShellInit = ''
    set NIX_PATH "$NIX_PATH:nixpkgs-overlays=/etc/nixos/overlays"
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';
  
  shellAbbrs = {
      # Nix
      ns = "nix shell";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#(hostname)";
      update = "nix flake update";
  };

  shellAliases = {
      mkdir = "mkdir -p";
  };
}
