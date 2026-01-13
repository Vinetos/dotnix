# https://danklinux.com/docs/dankmaterialshell/nixos
{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  imports = [
    inputs.dms.nixosModules.greeter
  ];
  # DMS greeter is based on greetd
  services.greetd.enable = true;
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "hyprland";
    configHome = "/home/vinetos";
    compositor.customConfig = ''

    '';
  };

}
