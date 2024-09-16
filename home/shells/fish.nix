{ pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${lib.getExe pkgs.any-nix-shell} fish --info-right | source
      ${pkgs.thefuck}/bin/thefuck --alias fuck | source
    '';

    shellAbbrs = {
      # Nix
      ns = "nix shell nixpkgs#";
      nr = "nix run nixpkgs#";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/\"?submodules=1#\"(hostname)";
      nrb = "sudo nixos-rebuild boot --flake /etc/nixos/\"?submodules=1#\"(hostname)";
      nu = "nix flake update";
      ngc = "sudo nix-collect-garbage -d && nix-collect-garbage";

      # Other
      cat = "bat -p";
      k = "kubectl";
      o = "openstack";
      wip = "git add -A && git commit -m wip";
    };

    shellAliases = {
      mkdir = "mkdir -p";
    };
  };
}
