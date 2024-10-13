{
  services.xserver = {
    enable = true;
    exportConfiguration = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  services.libinput.enable = true;
}
