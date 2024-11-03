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
    self.nixosModules.gui
    ./configuration.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

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
