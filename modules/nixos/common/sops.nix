{
  flake,
  lib,
  pkgs,
  ...
}:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    # age-plugin-yubikey workaround
    # $ age-plugin-yubikey --identity
    environment = {
      SOPS_AGE_KEY = ''
        AGE-PLUGIN-YUBIKEY-10FC5CQYZNFW0GTCHPMN9Y
      '';
    };

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      plugins = [ pkgs.age-plugin-yubikey ];
    };
    
    defaultSopsFile = ../../../secrets/example.enc.yaml;

    # This is using an age key that is expected to already be in the filesystem
    #age.keyFile = "%r/secrets/age-yubikey-identity-9a5cf42f.txt";
    # This is the actual specification of the secrets.
    secrets.example-key = { };
  };

}
