{ pkgs, ... }: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # utils
    file
    du-dust
    duf
    fd

    # kubernetes
    kubectl

    # CLI-Tools
    htop
    neofetch
    gnupg

    docker-compose
    nodejs

    tldr # Better than man
    github-copilot-intellij-agent
    thefuck
  ];

  programs = {
    bat.enable = true;
    ssh.enable = true;
  };
}
