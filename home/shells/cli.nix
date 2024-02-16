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

    # Kubernetes
    kubectl
    kubernetes-helm
    kubeseal

    # Openstack
    #openstackclient
    #heatclient

    # CLI-Tools
    htop
    neofetch
    gnupg
    ansible
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
