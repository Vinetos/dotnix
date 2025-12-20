{ pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      ${lib.getExe pkgs.any-nix-shell} fish --info-right | source
      ${lib.getExe pkgs.fastfetch} -c ${
        builtins.fetchurl {
          url = "https://raw.githubusercontent.com/harilvfs/fastfetch/refs/heads/main/config.jsonc";
          sha256 = "0ydzgdgcap6gkjpcih0bjir1qjg6i9yiisd7gx5cj3yvdd1zlhfs";
        }
      }
    '';

    shellAbbrs = {
      # Nix
      ns = "nix shell nixpkgs#";
      nr = "nix run nixpkgs#";
      nu = "nix flake update";
      ngc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";

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
