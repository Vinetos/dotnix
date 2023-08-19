{ ... }:
let
  darcula = builtins.fetchurl rec {
    url = "https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf";
    sha256 = "139irq012z2yaxabmx9xn352knj1316qlyzn27lnfx5y9izkygri";
  };

in
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = "include ${darcula}";
    settings = {
      background_opacity = toString 0.7;
    };
  };
}
