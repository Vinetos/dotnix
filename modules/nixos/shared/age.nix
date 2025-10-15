# Import agenix
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
#  imports = [
#  inputs.agenix.nixosModules.default
#  inputs.agenix-rekey.nixosModules.default
#  ];
#
#  agenix-rekey = agenix-rekey.configure {
#        userFlake = self;
#        nixosConfigurations = self.nixosConfigurations;
#      };
}
