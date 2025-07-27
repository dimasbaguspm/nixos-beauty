{ pkgs, ... }:
{
  # Enable Hyprland window manager (system-level)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable dconf for GNOME applications
  programs.dconf.enable = true;

  # Optional: Hint Electron apps to use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    # Fix for Nautilus display server connection
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    # Enable proper file manager integration
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
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

    # Essential GNOME services for Nautilus
    gnome = {
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      localsearch.enable = true; # Previously tracker-miners
      tinysparql.enable = true; # Previously tracker
    };

    # GVFS for virtual file system support (trash, network, etc.)
    gvfs.enable = true;

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
    flatpak
    # Better file manager with dependencies
    nautilus
    sushi # File preview support for Nautilus
    gnome-autoar # Archive support for Nautilus
    tinysparql # File indexing (previously tracker)
    localsearch # File indexing miners (previously tracker-miners)

    # Required for the default Hyprland config
    kitty

    # System utilities
    htop
    btop

    # Archive support for file manager
    file-roller

    # Image viewer
    feh

    # GTK theme packages for consistent theming
    gnome-themes-extra
    papirus-icon-theme
    bibata-cursors
    adwaita-qt

    # Dependencies for proper GTK theme rendering
    sassc # Required for building GTK themes
    gtk-engine-murrine # Required for murrine-based themes like Kanagawa

    # Essential tools (these are needed at system level)
    libnotify # For notify-send command
    pipewire
    wireplumber
  ];

  # Enable Flatpak system-wide
  services.flatpak.enable = true;

  # Ensure Flathub is added as a Flatpak remote at boot (per NixOS Wiki best practice)
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
