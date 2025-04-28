{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
  packages = self + /packages;
in
self: super: {
  desktime = self.callPackage "${packages}/desktime.nix" { };
}
