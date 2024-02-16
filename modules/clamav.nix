# ClamAV configuration
{ ... }: {

  services.clamav = {
    updater.enable = true;
    daemon.enable = true;
  };

}
