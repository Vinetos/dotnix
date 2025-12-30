# ClamAV is an antivirus

{ ... }:
{
  # ClamAV is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats.
  services.clamav = {
    scanner.enable = true;
    updater.enable = true;
    daemon.enable = true;
    fangfrisch.enable = true;
  };
}
