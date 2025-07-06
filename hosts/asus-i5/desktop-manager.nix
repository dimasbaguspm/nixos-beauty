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
    # Better file manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin

    # Application launcher
    rofi-wayland

    # Notification daemon
    dunst

    # Wallpaper setter
    swww

    # Screenshot tool
    grim
    slurp
    wl-clipboard
    libnotify # For notify-send command

    # Status bar
    waybar

    # Audio control
    pavucontrol
    pipewire
    wireplumber

    # Brightness control
    brightnessctl

    # System utilities
    htop
    btop

    # Archive support for file manager
    file-roller

    # Image viewer
    feh

    # Quick actions
    wlogout
    hyprlock
    swaylock-effects
  ];
}
