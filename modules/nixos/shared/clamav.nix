# ClamAV is an antivirus

{ ... }:
{
  services.clamav.daemon.enable = true;
  services.clamav.scanner.enable = true;
  services.clamav.updater.enable = true;
  services.clamav.fangfrisch.enable = true;
}
