# Import agenix
{
  flake,
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [ inputs.agenix.homeManagerModules.default ];
}
