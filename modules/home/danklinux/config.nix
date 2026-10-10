{ ... }:
{
  #
  programs.dank-material-shell = {
    settings = {
      lockScreenWidgetInstances = [
        {
          id = "lock_clock";
          widgetType = "desktopClock";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            style = "expressive";
            transparency = 0;
            weight = 0;
            twoTone = true;
            showDate = false;
            showDigitalSeconds = false;
            showAnalogNumbers = false;
            showAnalogSeconds = true;
            autoPosition = true;
            colorMode = "default";
            customColor = "#ffffff";
          };
        }
        {
          id = "lock_date";
          widgetType = "lockDate";
          enabled = false;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            format = "short";
            colorMode = "default";
            customColor = "#ffffff";
          };
        }
        {
          id = "lock_auth";
          widgetType = "lockAuth";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            style = "expressive";
            profileVisibility = "always";
            passwordVisibility = "always";
          };
        }
        {
          id = "lock_notifications";
          widgetType = "lockNotifications";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            mode = 2;
          };
        }
        {
          id = "lock_status";
          widgetType = "lockStatus";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            showMediaPlayer = true;
            showWeather = true;
            background = false;
          };
        }
        {
          id = "lock_power";
          widgetType = "lockPower";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            shape = "round";
          };
        }
      ];
      greeterWidgetInstances = [
        {
          id = "lock_clock";
          widgetType = "desktopClock";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            style = "expressive";
            transparency = 0;
            weight = 0;
            twoTone = true;
            showDate = false;
            showDigitalSeconds = false;
            showAnalogNumbers = false;
            showAnalogSeconds = true;
            autoPosition = true;
            colorMode = "default";
            customColor = "#ffffff";
          };
        }
        {
          id = "lock_date";
          widgetType = "lockDate";
          enabled = false;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            format = "short";
            colorMode = "default";
            customColor = "#ffffff";
          };
        }
        {
          id = "lock_auth";
          widgetType = "lockAuth";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            style = "expressive";
            profileVisibility = "always";
            passwordVisibility = "always";
          };
        }
        {
          id = "lock_status";
          widgetType = "lockStatus";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            showMediaPlayer = true;
            showWeather = true;
            background = false;
          };
        }
        {
          id = "lock_power";
          widgetType = "lockPower";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
            shape = "round";
          };
        }
        {
          id = "greeter_session";
          widgetType = "greeterSession";
          enabled = true;
          config = {
            displayPreferences = [
              "all"
            ];
            syncPositionAcrossScreens = true;
          };
        }
      ];
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
          magnification = false;
          magnificationScale = 130;
          magnificationProfile = "parabolic";
          magnificationExpand = false;
          order = [

          ];
          widgets = [
            {
              enabled = true;
              id = "dock_launcher";
              widgetId = "dockLauncher";
            }
            {
              enabled = true;
              id = "dock_apps";
              widgetId = "appsDock";
            }
            {
              enabled = true;
              id = "dock_trash";
              widgetId = "dockTrash";
            }
          ];
        }
      ];
      currentThemeCategory = "dynamic";
      matugenScheme = "scheme-vibrant";
      dmsWindowsFloatingSeeded = [
        "niri"
      ];
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
      batteryLowThreshold = 20;
      batteryNotifyLow = true;
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
              audioScrollMode = "volume";
              enabled = true;
              id = "music";
              mediaAdaptiveWidthEnabled = true;
              mediaSize = 1;
            }
            {
              clockCompactMode = false;
              enabled = true;
              id = "clock";
            }
          ];
          enabled = true;
          followInterfaceStyle = false;
          fontScale = 1;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          gothCornersEnabled = false;
          id = "default";
          innerPadding = 4;
          island = false;
          leftWidgets = [
            {
              enabled = true;
              id = "launcherButton";
              launcherLogoBrightness = 0.5;
              launcherLogoColorOverride = "";
              launcherLogoContrast = 1;
              launcherLogoCustomPath = "";
              launcherLogoMode = "os";
              launcherLogoSizeOffset = 2;
            }
            {
              dwlShowAllTags = false;
              enabled = true;
              groupActiveWorkspaceApps = false;
              groupWorkspaceApps = true;
              id = "workspaceSwitcher";
              maxWorkspaceIcons = 3;
              reverseScrolling = false;
              showOccupiedWorkspacesOnly = true;
              showWorkspaceApps = true;
              showWorkspaceIndex = true;
              showWorkspaceName = false;
              showWorkspacePadding = false;
              workspaceActiveAppHighlightEnabled = false;
              workspaceAppIconSizeOffset = 0;
              workspaceColorMode = "default";
              workspaceDragReorder = true;
              workspaceFocusedBorderColor = "primary";
              workspaceFocusedBorderCustomColor = "#6750A4";
              workspaceFocusedBorderEnabled = false;
              workspaceFocusedBorderThickness = 2;
              workspaceFocusedCustomColor = "#6750A4";
              workspaceFollowFocus = true;
              workspaceOccupiedColorMode = "none";
              workspaceOccupiedCustomColor = "#625B71";
              workspaceUnfocusedColorMode = "default";
              workspaceUnfocusedCustomColor = "#49454E";
              workspaceUnfocusedMonitorBorderColor = "primary";
              workspaceUnfocusedMonitorBorderCustomColor = "#6750A4";
              workspaceUnfocusedMonitorBorderEnabled = false;
              workspaceUnfocusedMonitorBorderThickness = 2;
              workspaceUnfocusedMonitorColorMode = "default";
              workspaceUnfocusedMonitorFocusedCustomColor = "#6750A4";
              workspaceUnfocusedMonitorOccupiedColorMode = "none";
              workspaceUnfocusedMonitorOccupiedCustomColor = "#625B71";
              workspaceUnfocusedMonitorSeparateAppearance = false;
              workspaceUnfocusedMonitorUnfocusedColorMode = "default";
              workspaceUnfocusedMonitorUnfocusedCustomColor = "#49454E";
              workspaceUnfocusedMonitorUrgentColorMode = "default";
              workspaceUnfocusedMonitorUrgentCustomColor = "#B3261E";
              workspaceUrgentColorMode = "default";
              workspaceUrgentCustomColor = "#B3261E";
            }
            {
              enabled = true;
              focusedWindowCompactMode = false;
              focusedWindowShowIcon = true;
              focusedWindowSize = 1;
              id = "focusedWindow";
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
              showAudioIcon = true;
              showAudioPercent = false;
              showBatteryIcon = false;
              showBluetoothIcon = true;
              showBrightnessIcon = false;
              showBrightnessPercent = false;
              showDoNotDisturbIcon = false;
              showIdleInhibitorIcon = false;
              showMicIcon = false;
              showMicPercent = false;
              showNetworkIcon = true;
              showPrinterIcon = false;
              showScreenSharingIcon = true;
              showVpnIcon = true;
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
          widgetFollowInterfaceStyle = false;
        }
      ];
      builtInPluginSettings = {
        dms_clipboard_search = {
          trigger = "cb";
        };
        dms_power = {
          trigger = "pw";
        };
        dms_qr_generator = {
          trigger = "qrg";
        };
        dms_settings_search = {
          trigger = "?";
        };
      };
      frameMode = "separate";
      configVersion = 39;
    };
  };
}
