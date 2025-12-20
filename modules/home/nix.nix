{
  # Garbage collect the Nix store
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };
}
