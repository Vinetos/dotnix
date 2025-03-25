# Atuin replaces your existing shell history with a SQLite database, and records additional context for your commands.
# With this context, Atuin gives you faster and better search of your shell history.
# https://docs.atuin.sh/
{ pkgs, ... }:
{
  # Install note for myself : Do not forget to run `atuin import auto` : https://docs.atuin.sh/reference/import/
  programs.atuin = {
    enable = true;
    daemon.enable = true;

    # Replace history shortcuts (ctrl+r) with atuin
    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = {
      update_check = false; # Using nix make this setting irrelevant
      sync_frequency = "1h"; # 0: Sync at every command
      style = "auto"; # Atuin will automatically switch to compact mode when the terminal window is too short for full to display properly.
    };
  };
}
