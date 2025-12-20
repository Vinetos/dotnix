{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
  packages = self + /packages;
in
self: super: {
  bibata-hyprcursor = self.callPackage "${packages}/bibata-hyprcursor" { };
}
