{
  nix = {
    # auto garbage collect
    gc = {
      automatic = true;
      dates = [ "Mon..Fri *-*-* 12:00:00" ];
      options = "--delete-older-than 7d";
    };
  };
}
