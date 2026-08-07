# https://danklinux.com/docs/dankmaterialshell/nixos
{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  imports = [
    inputs.dms-greeter.nixosModules.default
  ];
  # DMS greeter is based on greetd
  services.greetd.enable = true;
  programs.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/vinetos";
    compositor.customConfig = "";
  };

}
