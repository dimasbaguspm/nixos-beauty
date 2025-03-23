{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nix.nix
    ./timezone.nix
    ./internationalization.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "asus-i5";
  networking.networkmanager.enable = true;

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

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      kyrielle = {
        isNormalUser = true;
        description = "Kyrielle";
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };

  programs = {
    firefox.enable = true;
    zsh.enable = true;
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
