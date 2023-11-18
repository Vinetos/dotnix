{ pkgs, ... }: {
  home.packages = with pkgs; [ gh glab git-lfs gitAndTools.gitflow ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [ "*~" "*.swp" "*result*" ".direnv" "node_modules" ];

    # Signing Module
    signing = {
      key = "7F6B8E5090D9C31D";
      signByDefault = true;
    };

    # User config
    userName = "Vinetos";
    userEmail = "valentin" + "@" + "vinetos" + "." + "fr";

    # Extra Config
    extraConfig = {
      core = {
        editor = "vim";
        core.pager = "${pkgs.delta}/bin/delta --dark";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;

      safe.directory = [ "/etc/nixos" ]; # Allow to push my config with git
    };

    # Alias
    aliases = {
      # Better log
      l =
        "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
      # Branch create from $2 and create tracked branch
      bc = ''
        !sh -c 'git switch -c "$1" main && git push --set-upstream origin "$1"' -'';
      bcf = ''
        !sh -c 'git switch -c "$1" "$2" && git push --set-upstream origin "$1"' -'';
      bd = ''
        !sh -c 'git switch main && git push -d origin "$1" && git branch -d "$1"' -'';
      br = ''
        !sh -c 'git switch "$1" && git pull && git switch "$2" && git rebase origin/"$1"' -'';
    };

  };
}
