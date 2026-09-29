{ ... }:
{
  #
  programs.dank-material-shell = {
    settings = {
      currentThemeName = "dynamic";
      radiusStrength = 38;
      clockFormat = "24h";
      animationDuration = 500;
      blurBorderOpacity = 1;
      lockDateFormat = "dddd, MMMM d";
      useAutoLocation = true;
      fontFamily = "Inter Variable";
      lockScreenShowPowerActions = true;
      dockConfigs = [
        {
          id = "dock";
          name = "Dock";
          enabled = false;
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          position = 1;
          mode = "compact";
          taskbarAlign = "center";
          widgetExpansion = "popout";
          iconSize = 40;
          spacing = 4;
          itemSpacing = 4;
          margin = 0;
          bottomGap = 0;
          transparency = 0;
          followInterfaceStyle = false;
          autoHide = true;
          smartAutoHide = false;
          useOverlayLayer = false;
          editOnRightClick = false;
          showOnFullscreen = false;
          openOnOverview = false;
          groupByApp = true;
          separatePinnedAndRunningApps = false;
          restoreSpecialWorkspaceOnClick = false;
          isolateDisplays = false;
          indicatorStyle = "line";
          borderEnabled = true;
          borderColor = "surfaceText";
          borderOpacity = 0.2;
          borderThickness = 1;
          launcherEnabled = false;
          launcherLogoMode = "apps";
          launcherLogoCustomPath = "";
          launcherLogoColorOverride = "";
          launcherLogoSizeOffset = 0;
          launcherLogoBrightness = 0.5;
          launcherLogoContrast = 1;
          maxVisibleApps = 0;
          maxVisibleRunningApps = 0;
          showOverflowBadge = true;
          showTrash = false;
          trashFileManager = "default";
          trashCustomCommand = "";
          order = [

          ];
          widgets = [
            {
              id = "dock_launcher";
              widgetId = "dockLauncher";
              enabled = true;
            }
            {
              id = "dock_apps";
              widgetId = "appsDock";
              enabled = true;
            }
            {
              id = "dock_trash";
              widgetId = "dockTrash";
              enabled = true;
            }
          ];
        }
      ];
      currentThemeCategory = "dynamic";
      matugenScheme = "scheme-vibrant";
      widgetBackgroundColor = "sc";
      widgetColorMode = "colorful";
      showWeekNumber = true;
      barElevationEnabled = false;
      blurEnabled = true;
      blurBorderSeeded = true;
      clockDateFormat = "dd/MM/yyyy";
      dashTabs = [
        {
          enabled = true;
          id = "overview";
        }
        {
          enabled = true;
          id = "media";
        }
        {
          enabled = true;
          id = "wallpaper";
        }
        {
          enabled = true;
          id = "weather";
        }
        {
          enabled = true;
          id = "settings";
        }
      ];
      dashOptions = {
        media = {
          albumArtAccent = false;
        };
      };
      cursorSettings = {
        dwl = {
          cursorHideTimeout = 0;
        };
        hyprland = {
          hideOnKeyPress = false;
          hideOnTouch = false;
          inactiveTimeout = 0;
        };
        niri = {
          hideAfterInactiveMs = 0;
          hideWhenTyping = false;
        };
        size = 24;
        theme = "System Default";
      };
      soundLogin = true;
      acLockTimeout = 60;
      acSuspendBehavior = 2;
      batteryLockTimeout = 60;
      lockBeforeSuspend = true;
      terminalsAlwaysDark = true;
      matugenTemplateNeovim = true;
      osdAlwaysShowValue = true;
      osdPosition = 7;
      osdMediaPlaybackEnabled = true;
      osdPowerProfileEnabled = true;
      updaterIntervalSeconds = 86400;
      screenPreferences = {
        wallpaper = [
          "all"
        ];
      };
      displayProfiles = {
        hyprland = {
          profile_1773301782332_xaf4cj = {
            createdAt = 1773301782332;
            id = "profile_1773301782332_xaf4cj";
            name = "Home";
            outputSet = [
              "DP-1"
              "DP-3"
              "eDP-1"
            ];
            updatedAt = 1773301782332;
          };
          profile_1773301794650_76nj10 = {
            createdAt = 1773301794650;
            id = "profile_1773301794650_76nj10";
            name = "Work";
            outputSet = [
              "DP-1"
              "DP-3"
              "eDP-1"
            ];
            updatedAt = 1773301794650;
          };
        };
      };
      displayProfileAutoSelect = true;
      displayShowDisconnected = true;
      barConfigs = [
        {
          autoHide = false;
          autoHideDelay = 250;
          borderColor = "surfaceText";
          borderEnabled = false;
          borderOpacity = 1;
          borderThickness = 1;
          bottomGap = 0;
          centerWidgets = [
            {
              enabled = true;
              id = "weather";
            }
            {
              enabled = true;
              id = "music";
              mediaSize = 1;
              mediaAdaptiveWidthEnabled = true;
              audioScrollMode = "volume";
            }
            {
              enabled = true;
              id = "clock";
              clockCompactMode = false;
            }
          ];
          enabled = true;
          fontScale = 1;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          gothCornersEnabled = false;
          id = "default";
          innerPadding = 4;
          leftWidgets = [
            {
              enabled = true;
              id = "launcherButton";
              launcherLogoMode = "os";
              launcherLogoCustomPath = "";
              launcherLogoColorOverride = "";
              launcherLogoBrightness = 0.5;
              launcherLogoContrast = 1;
              launcherLogoSizeOffset = 2;
            }
            {
              enabled = true;
              id = "workspaceSwitcher";
              showWorkspaceIndex = true;
              showWorkspaceName = false;
              showWorkspacePadding = false;
              showWorkspaceApps = true;
              workspaceDragReorder = true;
              maxWorkspaceIcons = 3;
              workspaceAppIconSizeOffset = 0;
              groupWorkspaceApps = true;
              groupActiveWorkspaceApps = false;
              workspaceFollowFocus = true;
              showOccupiedWorkspacesOnly = true;
              reverseScrolling = false;
              dwlShowAllTags = false;
              workspaceActiveAppHighlightEnabled = false;
              workspaceColorMode = "default";
              workspaceFocusedCustomColor = "#6750A4";
              workspaceOccupiedColorMode = "none";
              workspaceOccupiedCustomColor = "#625B71";
              workspaceUnfocusedColorMode = "default";
              workspaceUnfocusedCustomColor = "#49454E";
              workspaceUrgentColorMode = "default";
              workspaceUrgentCustomColor = "#B3261E";
              workspaceFocusedBorderEnabled = false;
              workspaceFocusedBorderColor = "primary";
              workspaceFocusedBorderCustomColor = "#6750A4";
              workspaceFocusedBorderThickness = 2;
              workspaceUnfocusedMonitorSeparateAppearance = false;
              workspaceUnfocusedMonitorColorMode = "default";
              workspaceUnfocusedMonitorFocusedCustomColor = "#6750A4";
              workspaceUnfocusedMonitorOccupiedColorMode = "none";
              workspaceUnfocusedMonitorOccupiedCustomColor = "#625B71";
              workspaceUnfocusedMonitorUnfocusedColorMode = "default";
              workspaceUnfocusedMonitorUnfocusedCustomColor = "#49454E";
              workspaceUnfocusedMonitorUrgentColorMode = "default";
              workspaceUnfocusedMonitorUrgentCustomColor = "#B3261E";
              workspaceUnfocusedMonitorBorderEnabled = false;
              workspaceUnfocusedMonitorBorderColor = "primary";
              workspaceUnfocusedMonitorBorderCustomColor = "#6750A4";
              workspaceUnfocusedMonitorBorderThickness = 2;
            }
            {
              enabled = true;
              id = "focusedWindow";
              focusedWindowCompactMode = false;
              focusedWindowShowIcon = true;
              focusedWindowSize = 1;
            }
          ];
          maximizeDetection = true;
          name = "Main Bar";
          noBackground = false;
          openOnOverview = false;
          popupGapsAuto = true;
          popupGapsManual = 4;
          position = 0;
          rightWidgets = [
            {
              enabled = true;
              id = "keyboard_layout_name";
              keyboardLayoutNameCompactMode = true;
              keyboardLayoutNameShowIcon = false;
            }
            {
              enabled = true;
              id = "notificationButton";
            }
            {
              enabled = true;
              id = "battery";
              showBatteryPercent = true;
              showBatteryPercentOnlyOnBattery = false;
              showBatteryTime = false;
              showBatteryTimeOnlyOnBattery = false;
            }
            {
              enabled = true;
              id = "controlCenterButton";
              showNetworkIcon = true;
              showVpnIcon = true;
              showBluetoothIcon = true;
              showAudioIcon = true;
              showAudioPercent = false;
              showMicIcon = false;
              showMicPercent = false;
              showBrightnessIcon = false;
              showBrightnessPercent = false;
              showBatteryIcon = false;
              showPrinterIcon = false;
              showScreenSharingIcon = true;
              showIdleInhibitorIcon = false;
              showDoNotDisturbIcon = false;
            }
            {
              enabled = true;
              id = "idleInhibitor";
            }
          ];
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          spacing = 4;
          squareCorners = false;
          transparency = 0;
          visible = true;
          widgetOutlineColor = "surfaceText";
          widgetOutlineEnabled = true;
          widgetOutlineOpacity = 0.2;
          widgetOutlineThickness = 1;
          widgetTransparency = 0.6;
          followInterfaceStyle = false;
          island = false;
        }
      ];
      builtInPluginSettings = {
        dms_clipboard_search = {
          trigger = "cb";
        };
        dms_qr_generator = {
          trigger = "qrg";
        };
        dms_settings_search = {
          trigger = "?";
        };
        dms_power = {
          trigger = "pw";
        };
      };
      frameMode = "separate";
      configVersion = 29;
    };
  };
}
