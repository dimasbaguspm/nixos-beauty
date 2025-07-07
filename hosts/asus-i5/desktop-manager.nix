{ pkgs, ... }:
{
  # Enable Hyprland window manager (system-level)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Optional: Hint Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
    nautilus
    
    # Required for the default Hyprland config
    kitty

    # System utilities
    htop
    btop

    # Archive support for file manager
    file-roller

    # Image viewer
    feh

    # Essential tools (these are needed at system level)
    libnotify # For notify-send command
    pipewire
    wireplumber
  ];
}
