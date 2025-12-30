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
          rev = "95628dde134ec7ce4e01e58e1bb5f6dfc4c2baac";
          hash = "sha256-jGLgc+OTSkO1D2RwRXAy75jyWmRREkFa86rMqS2PZfg=";
        };
      };
      HyprlandSubmap = {
        src = pkgs.fetchFromGitHub {
          owner = "mesteryui";
          repo = "DMS_HyprlandSubmap";
          rev = "faf69c7a17aa0096c59150a5d492b551e4a24de3";
          hash = "sha256-5srAvsrhBUtzPNf3FTComfm+4alh4B41StHPZryQi2M=";
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
    # Include dank linux configuration
    gtk3.extraCss = "@import url(\"dank-colors.css\");";
    gtk4.extraCss = "@import url(\"dank-colors.css\");";
  };

}
