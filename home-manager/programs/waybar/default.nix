{ inputs, system, pkgs,...}:

{
  enable = true;
  package = inputs.hyprland.packages.${system}.waybar-hyprland;
  systemd.enable = true;
}
