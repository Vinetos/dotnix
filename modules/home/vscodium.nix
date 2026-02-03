{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      #3timeslazy.vscodium-devpodcontainers
      #4ops.terraform
      aaron-bond.better-comments
      #astral-sh.ty
      bierner.markdown-mermaid
      #bpruitt-goddard.mermaid-markdown-syntax-highlighting
      charliermarsh.ruff
      #darkriszty.markdown-table-prettify
      docker.docker
      dracula-theme.theme-dracula
      eamodio.gitlens
      esbenp.prettier-vscode
      foxundermoon.shell-format
      golang.go
      hashicorp.hcl
      hashicorp.terraform
      #icrawl.discord-vscode
      #jeanp413.open-remote-ssh
      mikestead.dotenv
      ms-azuretools.vscode-containers
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-python.black-formatter
      ms-python.debugpy
      ms-python.python
      #ms-python.vscode-python-envs
      oderwat.indent-rainbow
      redhat.ansible
      redhat.vscode-yaml
      samuelcolvin.jinjahtml
      #sanderronde.vscode--gerrit
      shardulm94.trailing-spaces
      signageos.signageos-vscode-sops
      tamasfe.even-better-toml
      #weaveworks.vscode-gitops-tools
    ];
  };
}
