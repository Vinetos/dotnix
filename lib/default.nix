{ inputs, ... }:
let
  inherit (inputs.nixpkgs) lib;
  colorlib = import ./colors.nix lib;
in
{
  imports = [
    {
      # get default across the module system
      _module.args = {
        default = import ./theme { inherit colorlib lib; };
      };
    }
  ];
  perSystem = { system, ... }: {
    legacyPackages = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
}
