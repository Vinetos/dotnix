{config, pkgs, ...}:

{
  systemd.services.battery_check = {
    #after = [ "display-manager" ]; TODO: FIXME
    description = "Send a notification when low battery";
    serviceConfig = {
      Type      = "simple";
      ExecStart = ''${pkgs.libnotify}/bin/notify-send "Low battery"'';
      #ExecStart = ''
      #         test (cat /sys/class/power_supply/BAT1/capacity) -lt 150 && notify-send -u critical "LOW BATTERY"
      #'';
      Restart    = "always";
      RestartSec = "30";
    };
  };

  environment.systemPackages = with pkgs; [
    libnotify
    notify-osd
  ];

}
