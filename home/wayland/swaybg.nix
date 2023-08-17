{ pkgs
, lib
, default
, ...
}: {
  config.wallpaper = builtins.fetchurl rec {
    name = "wallpaper-${sha256}.png";
    url = "https://github.com/catppuccin/wallpapers/raw/0cea4a28451851a637762dec07ec4fb2bfebc421/minimalistic/black5_unicat.png";
    sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
  };

  systemd.user.services.swaybg = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.swaybg} -i ${config.wallpaper} -m fill";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
