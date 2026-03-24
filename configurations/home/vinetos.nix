{ flake, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "vinetos";
    fullname = "Vinetos";
    email = "contact+git" + "@" + "vinetos" + "." + "fr";
  };
  home.stateVersion = lib.mkDefault "24.11";
}
