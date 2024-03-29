{ ... }:
{
  imports = [ ./config.nix ];

  programs.waybar.style = ./style.css;
}

