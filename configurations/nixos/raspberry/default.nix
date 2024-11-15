# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
    self.nixosModules.default
    #self.nixosModules.gui
    ./configuration.nix
  ];

  # Enable home-manager for "vinetos" user
  home-manager.users."vinetos" = {
    imports = [ (self + /configurations/home/vinetos.nix) ];
  };

  # TODO: Move this to be shared with other config
  users.users.vinetos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
}
