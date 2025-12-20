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

    # For macOS's default shell.
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      envExtra = ''
        # Custom zshrc goes here
      '';
    };

    nushell.enable = true;

    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Better shell prompt!
    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = lib.mkMerge [
        (builtins.fromTOML (
          builtins.readFile "${pkgs.starship}/share/starship/presets/pastel-powerline.toml"
        ))
      ];
    };
  };
}
