# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    #self.nixosModules.gui
    ./configuration.nix
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];

  # Enable home-manager for "vinetos" user
  home-manager.users."vinetos" = {
    imports = [ (self + /configurations/home/vinetos.nix) ];
  };
}
