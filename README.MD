# Vinetos Flake Nixos Configuration
This is my NixOS configuration using Flake for all my computers.

# Apply config
```sh
sudo nixos-rebuild switch --flake /path/to/this#<computer> [--impure]
```

# Update flakes
```sh
nix flake update
```
# Format the config
```sh
nix run nixpkgs#nixpkgs-fmt **.nix
```

# What's inside

## 🗃️ Contents

- [modules](modules): NixOS common configs
- [hosts](hosts): host-specific configuration
- [home](home): my [Home Manager](https://github.com/nix-community/home-manager) config
- [lib](lib): helper functions
