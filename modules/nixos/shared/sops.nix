# Import nix sops
{ flake
, config
, pkgs
, lib
, ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
}
