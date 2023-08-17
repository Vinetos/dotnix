{ pkgs, ... }: {
  security.doas = {
    enable = true;
    extraRules = [
      {
        groups = [ "wheel" ];
        persist = true;
        keepEnv = true;
      }
    ];
  };

  security.sudo = {
    enable = false;
    execWheelOnly = true;
  };

  # Alias sudo to doas
  environment.systemPackages = [
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
  ];
}
