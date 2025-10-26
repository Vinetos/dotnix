{
  pkgs,
  lib,
  config,
  default,
  ...
}:
{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        bars = 12;
        sleep_timer = 10;
      };
      output = {
        method = "raw";
        data_format = "ascii";
        ascii_max_range = 6;
      };
    };
  };
}
