{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
  packages = self + /packages;
in
self: super: {
  bibata-hyprcursor = self.callPackage "${packages}/bibata-hyprcursor" { };
  zen-browser = inputs.zen-browser.packages."${self.system}".specific;
  desktime = self.callPackage "${packages}/desktime.nix" { };
  openstack-exporter = self.callPackage "${packages}/openstack-exporter.nix" { };
}
