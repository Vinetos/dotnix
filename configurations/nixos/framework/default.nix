{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
    ./hardware-configuration.nix
  ];

  # Enable home-manager for "vinetos" user
    home-manager.users."vinetos" = {
      imports = [ (self + /configurations/home/vinetos.nix) ];
    };

    # TODO: Move this to be shared with other config
    users.users.vinetos = {
      isNormalUser = true;
      extraGroups = [
            "wheel"
            "video"
            "networkmanager"
            "docker"
            "libvirtd"
          ];
    };

    nixpkgs.config.allowUnfree = true;

}
