{ pkgs
, ...
}: {

  # Tailscale
  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    wireguard-tools
    tailscale
  ];

  # Enable networking
  networking = {
    nameservers = [ "100.100.100.100" "1.1.1.1" "1.0.0.1" ];
    search = [ "tail9f2c8.ts.net" ];
    firewall.checkReversePath = false;
  };
}
