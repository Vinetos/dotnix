# Vinetos Nixos Configuration (Unstable + Flakes)
This is my NixOS configuration using Flake for all my computers and servers.  
This config allow me to have per-machine configuration (e.g. modules, hardware specific) AND per-user per-machine configuration (e.g. profiles, workspaces, ...).

# What's inside
Some of the noticeable things I use :

- Nix with Flakes built on top of unstable
- Home-manager for per-user configuration
- Wayland (Hyprland, Hyprpaper, Hyprlock)
- DoAs (alternative to sudo)
- Kitty terminal, Fish as shell
- Tailscale and OpenVPN


## 🗃️ Contents
- [home](home): my [Home Manager](https://github.com/nix-community/home-manager) config
- [home/profiles](home/profiles): per-user-per-computer configuration
- [hosts](hosts): computer-specific configurations
- [lib](lib): helper functions
- [modules](modules): common NixOS system configs

# Apply config
```sh
sudo nixos-rebuild <switch/boot> --flake /path/to/this#<computer> [--impure]
```

# Update flakes
```sh
nix flake update
```
# Format the config
```sh
nix run nixpkgs#nixpkgs-fmt **.nix
```


