{ pkgs, ... }:

{
  enable = true;
  interactiveShellInit = ''
    set NIX_PATH "$NIX_PATH:nixpkgs-overlays=/etc/nixos/overlays"
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';
  
  shellAbbrs = {
      # Nix
      ns = "nix-shell";
  };

  shellAliases = {
      rebuild = "sudo -E && echo $NIX_PATH && nixos-rebuild switch --upgrade-all";
  };
}
