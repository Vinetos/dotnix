{
  flake,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    flake.inputs.dms.homeModules.default
  ];

  # For Linux WallpaperEngine Plugin
  services.linux-wallpaperengine.enable = true;
  # Clear linux-wallpaperengine service as it is managed by DMS
  systemd.user.services."linux-wallpaperengine".Service.ExecStart =
    lib.mkForce "${pkgs.coreutils}/bin/echo disabled";

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)

    plugins = {
      LinuxWallpaperEnginePlugin = {
        src = pkgs.fetchFromGitHub {
          owner = "sgtaziz";
          repo = "dms-wallpaperengine";
          rev = "295686215ba65103e20385d3e86801db074dfc01";
          hash = "sha256-HmqIAXNougNJScAQXS33CRl/+ypR9LNjGFhBOVwu5z0=";
        };
      };
    };
  };

  # Configure kitty to use DMS config
  programs.kitty.extraConfig = "
      include dank-tabs.conf
      include dank-theme.conf
    ";

  # Configure GTK to use DMS themes
  gtk = {
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    # Include dank linux configuration
    gtk3.extraCss = "@import url(\"dank-colors.css\");";
    gtk4.extraCss = "@import url(\"dank-colors.css\");";
  };

}
