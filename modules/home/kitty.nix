{
  flake,
  lib,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-sudo";
    shellIntegration.enableBashIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "${lib.getExe pkgs.fish}";
      background_opacity = toString 0.7;
      confirm_os_window_close = 0;

      scrollback_lines = 40000; # 32 MB whit 100 chars per line for 40k lines
      scrollback_pager_history_size = "1000"; # Max 1 GB of history on disk

      copy_on_select = "no";
    };
    extraConfig = ''
      map ctrl+c       copy_and_clear_or_interrupt
      map ctrl+v       paste_from_clipboard
      map shift+insert paste_from_clipboard
    '';
  };
}
