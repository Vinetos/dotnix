{ pkgs, lib, ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  # https://nixos.asia/en/git
  home.packages = with pkgs; [
    gh
    glab
    git-lfs
    gitflow
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      "node_modules"
      ".idea"
    ];

    # Signing Module
    signing = {
      key = lib.mkDefault "3EC1FE8DF090B8CF";
      signByDefault = lib.mkDefault true;
    };

    settings = {
      # User config
      user.name = lib.mkDefault "Vinetos";
      user.email = lib.mkDefault ("contact+git" + "@" + "vinetos" + "." + "fr");

      # Alias
      alias = {
        # Better log
        l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
        adog = "log --all --decorate --oneline --graph";
      };
    };

    # Extra Config
    settings = {
      core = {
        editor = "vim";
        core.pager = "${pkgs.delta}/bin/delta --dark";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
