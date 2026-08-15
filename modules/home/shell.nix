{ pkgs, lib, ... }:
{
  programs = {
    # on macOS, you probably don't need this
    bash = {
      enable = true;
      initExtra = ''
        # Custom bash profile goes here
      '';
    };

    nushell.enable = true;

    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Better shell prompt!
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableTransience = true;
      settings = lib.mkMerge [
        (builtins.fromTOML (
          builtins.readFile "${pkgs.starship}/share/starship/presets/pastel-powerline.toml"
        ))
        ({
          kubernetes.disabled = false;
          openstack.disabled = false;
        })
      ];
    };
  };
}
