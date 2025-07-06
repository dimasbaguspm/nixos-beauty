{ pkgs, ... }:
{
  # Enable Hyprland window manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable XDG desktop portal for screen sharing and file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  services = {
    # Keep X11 enabled for compatibility but use SDDM for Wayland support
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Use SDDM display manager which works better with Wayland
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    # Keep audio services
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Keep printing
    printing = { enable = true; };
  };

  # Enable some essential packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Terminal emulator (you already have kitty configured)
    # Application launcher
    rofi-wayland

    # Notification daemon
    dunst

    # Wallpaper setter
    swww

    # Screenshot tool
    grim
    slurp

    # Clipboard manager
    wl-clipboard

    # Status bar
    waybar

    # File manager (you already have yazi, but GUI option)
    nautilus
  ];
}
