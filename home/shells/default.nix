{ ... }:

{
  imports = [
    ./cli.nix
    ./starship.nix
    ./fish.nix
  ];

  # add environment variables
  home.sessionVariables = {
    # clean up ~
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    EDITOR = "vim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };
}
