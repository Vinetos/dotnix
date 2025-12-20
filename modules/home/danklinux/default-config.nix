{ ... }:
{
  programs.dank-material-shell.default = {
    settings = {
      currentThemeName = "dynamic";
      customThemeFile = "";
      matugenScheme = "scheme-vibrant";
      runUserMatugenTemplates = true;
      matugenTargetMonitor = "";
      popupTransparency = 1;
      dockTransparency = 0;
      widgetBackgroundColor = "sc";
      widgetColorMode = "colorful";
      cornerRadius = 12;
      use24HourClock = true;
      showSeconds = false;
      useFahrenheit = false;
      nightModeEnabled = false;
      animationSpeed = 2;
      customAnimationDuration = 500;
      wallpaperFillMode = "Fill";
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      enabledGpuPciIds = [

      ];
      showSystemTray = true;
      showClock = true;
      showNotificationButton = true;
      showBattery = true;
      showControlCenterButton = true;
      showCapsLockIndicator = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      controlCenterShowVpnIcon = true;
      controlCenterShowBrightnessIcon = false;
      controlCenterShowMicIcon = false;
      controlCenterShowBatteryIcon = false;
      controlCenterShowPrinterIcon = false;
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;
      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "nightMode";
          enabled = true;
          width = 50;
        }
        {
          id = "darkMode";
          enabled = true;
          width = 50;
        }
      ];
      showWorkspaceIndex = true;
      showWorkspacePadding = false;
      workspaceScrolling = false;
      showWorkspaceApps = true;
      maxWorkspaceIcons = 3;
      workspacesPerMonitor = true;
      showOccupiedWorkspacesOnly = true;
      dwlShowAllTags = false;
      workspaceNameIcons = {
      };
      waveProgressEnabled = true;
      scrollTitleEnabled = true;
      clockCompactMode = false;
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      keyboardLayoutNameCompactMode = false;
      runningAppsCurrentWorkspace = true;
      runningAppsGroupByApp = false;
      centeringMode = "index";
      clockDateFormat = "dd/MM/yyyy";
      lockDateFormat = "dddd, MMMM d";
      mediaSize = 1;
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      sortAppsAlphabetically = false;
      appLauncherGridColumns = 4;
      spotlightCloseNiriOverview = true;
      niriOverviewOverlayEnabled = true;
      weatherLocation = "";
      weatherCoordinates = "";
      useAutoLocation = true;
      weatherEnabled = true;
      networkPreference = "auto";
      vpnLastConnected = "";
      iconTheme = "System Default";
      launcherLogoMode = "os";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "";
      launcherLogoColorInvertOnMode = false;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      launcherLogoSizeOffset = 2;
      fontFamily = "Inter Variable";
      monoFontFamily = "Fira Code";
      fontWeight = 400;
      fontScale = 1;
      notepadUseMonospace = true;
      notepadFontFamily = "";
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = -1;
      notepadLastCustomTransparency = 0.7;
      soundsEnabled = true;
      useSystemSoundTheme = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;
      acMonitorTimeout = 0;
      acLockTimeout = 60;
      acSuspendTimeout = 0;
      acSuspendBehavior = 2;
      acProfileName = "";
      batteryMonitorTimeout = 0;
      batteryLockTimeout = 0;
      batterySuspendTimeout = 0;
      batterySuspendBehavior = 0;
      batteryProfileName = "";
      lockBeforeSuspend = true;
      loginctlLockIntegration = true;
      fadeToLockEnabled = true;
      fadeToLockGracePeriod = 5;
      launchPrefix = "";
      brightnessDevicePins = {
      };
      wifiNetworkPins = {
      };
      bluetoothDevicePins = {
      };
      audioInputDevicePins = {
      };
      audioOutputDevicePins = {
      };
      gtkThemingEnabled = false;
      qtThemingEnabled = false;
      syncModeWithPortal = true;
      terminalsAlwaysDark = false;
      showDock = true;
      dockAutoHide = true;
      dockGroupByApp = true;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = 0;
      dockMargin = 0;
      dockIconSize = 40;
      dockIndicatorStyle = "line";
      dockBorderEnabled = true;
      dockBorderColor = "surfaceText";
      dockBorderOpacity = 0.2;
      dockBorderThickness = 1;
      notificationOverlayEnabled = false;
      modalDarkenBackground = true;
      lockScreenShowPowerActions = true;
      enableFprint = false;
      maxFprintTries = 15;
      lockScreenActiveMonitor = "all";
      lockScreenInactiveColor = "#000000";
      hideBrightnessSlider = false;
      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationPopupPosition = 0;
      osdAlwaysShowValue = true;
      osdPosition = 7;
      osdVolumeEnabled = true;
      osdMediaVolumeEnabled = true;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      osdAudioOutputEnabled = true;
      powerActionConfirm = true;
      powerActionHoldDuration = 0.5;
      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
        "restart"
      ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;
      customPowerActionLock = "";
      customPowerActionLogout = "";
      customPowerActionSuspend = "";
      customPowerActionHibernate = "";
      customPowerActionReboot = "";
      customPowerActionPowerOff = "";
      updaterUseCustomCommand = false;
      updaterCustomCommand = "";
      updaterTerminalAdditionalParams = "";
      displayNameMode = "system";
      screenPreferences = {
        wallpaper = [
          "all"
        ];
      };
      showOnLastDisplay = {
      };
      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          leftWidgets = [
            "launcherButton"
            {
              id = "workspaceSwitcher";
              enabled = true;
            }
            {
              id = "focusedWindow";
              enabled = true;
            }
          ];
          centerWidgets = [
            {
              id = "weather";
              enabled = true;
            }
            {
              id = "music";
              enabled = true;
            }
            {
              id = "clock";
              enabled = true;
            }
          ];
          rightWidgets = [
            {
              id = "cpuUsage";
              enabled = true;
            }
            {
              id = "memUsage";
              enabled = true;
            }
            {
              id = "battery";
              enabled = true;
            }
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
            }
          ];
          spacing = 4;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 0;
          widgetTransparency = 0.6;
          squareCorners = false;
          noBackground = false;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1;
          borderThickness = 1;
          widgetOutlineEnabled = true;
          widgetOutlineColor = "surfaceText";
          widgetOutlineOpacity = 0.2;
          widgetOutlineThickness = 1;
          fontScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
          maximizeDetection = true;
        }
      ];
      configVersion = 1;
    };
  };
}
