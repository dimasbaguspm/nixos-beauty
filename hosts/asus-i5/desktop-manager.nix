{
  services = {
    xserver = {
      enable = true;
      desktopManager = { gnome.enable = true; };
      displayManager = {
        gdm.enable = true;
        autoLogin = {
          enable = true;
          user = "kyrielle";
        };
      };
      xkb = {
        layout = "us";
        variant = "";
      };

    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing = { enable = true; };
  };
}
