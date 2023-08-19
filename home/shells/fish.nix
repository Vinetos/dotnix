{ pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${lib.getExe pkgs.any-nix-shell} fish --info-right | source
    '';

    shellAbbrs = {
      # Nix
      ns = "nix shell nixpkgs#";
      nr = "nix run nixpkgs#";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/#(hostname)";
      nri = "sudo nixos-rebuild switch --flake /etc/nixos/#(hostname) --impure";
      nu = "nix flake update";
      ngc = "sudo nix-collect-garbage -d";

      # Other
      cat = "bat -p";
      wip = "git add -A && git commit -m wip";
    };

    shellAliases = {
      mkdir = "mkdir -p";
    };
  };
}
