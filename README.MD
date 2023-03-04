# Vinetos Flake Nixos Configuration
This is my NixOS configuration using Flake for all my computers.

# Apply config
```sh
sudo nixos-rebuild switch --flake /path/to/this#<computer>
```

# Update flakes
```sh
sudo nix flake update
```

# What's inside
TODO
```
.
├── flake.lock
├── flake.nix
├── framework/
├── home-manager/
└── overlays/
```

