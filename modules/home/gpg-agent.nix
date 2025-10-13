{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };

  # This avoids the problem where GnuPG will repeatedly prompt for the insertion of an already-inserted YubiKey
  programs.gpg.scdaemonSettings.disable-ccid = true;
}
