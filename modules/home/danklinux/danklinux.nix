{
  flake,
  lib,
  pkgs,
  config,
  ...
}:
{
  imports = [
    flake.inputs.dms.homeModules.default
  ];

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
    enableClipboardPaste = true; # Manage clipboard history

    plugins = {
      linuxWallpaperEngine = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "sgtaziz";
          repo = "dms-wallpaperengine";
          rev = "95628dde134ec7ce4e01e58e1bb5f6dfc4c2baac";
          hash = "sha256-jGLgc+OTSkO1D2RwRXAy75jyWmRREkFa86rMqS2PZfg=";
        };
        settings = {
          generateStaticWallpaper = true;
          monitorScenes = {
            eDP-1 = "1515469208";
            DP-1 = "1515469208";
            DP-3 = "1515469208";
          };
          sceneSettings = {
            "3397639340" = {
              scaling = "fill";
            };
          };
        };
      };
      hyprlandSubmap = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "mesteryui";
          repo = "DMS_HyprlandSubmap";
          rev = "b9a289a8239ea8651876cc38aa936181b8e1d313";
          hash = "sha256-EJ8MCxnA/eZUccUf7EG6N8hPHblTXSlgXfxwLy/Jt8s=";
        };
      };
    };
  };

  # Configure Hyprland
  wayland.windowManager.hyprland.settings.source = [
    "${config.xdg.configHome}/hypr/dms/outputs.conf"
    "${config.xdg.configHome}/hypr/dms/colors.conf"
  ];

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

  # For Linux WallpaperEngine Plugin
  services.linux-wallpaperengine.enable = true;
  # Clear linux-wallpaperengine service as it is managed by DMS
  systemd.user.services."linux-wallpaperengine".Service.ExecStart =
    lib.mkForce "${pkgs.coreutils}/bin/echo disabled";

  # Configure Zen-browser with DMS
  programs.zen-browser.profiles.default.settings."toolkit.legacyUserProfileCustomizations.stylesheets" =
    true;
  home.file.".zen/default/chrome/userChrome.css".source =
    config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/DankMaterialShell/zen.css";

}
