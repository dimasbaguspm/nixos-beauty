# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../../programs/nixvim ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "asus-i5"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";

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

    printing = { enable = true; };
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      CODE_STATS_BASE_URL = "https://codestats.net";
      CODE_STATS_USERNAME = "dimasbaguspm";
      CODE_STATS_API =
        "SFMyNTY.WkdsdFlYTmlZV2QxYzNCdCMjTWpVeE1EUT0.kWTeZEGOsAvznr_mMiWYMzCgPzy8gYwE01teL8AJcyc";
    };
  };
  system.stateVersion = "24.11"; # Did you read the comment?

}
