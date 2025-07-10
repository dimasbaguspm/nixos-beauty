{ pkgs, ... }:
{
  # GTK theme configuration using Kanagawa theme to match your setup
  gtk = {
    enable = true;

    # Use Kanagawa GTK theme
    theme = {
      name = "Kanagawa-BL"; # or "Kanagawa-BL-LB" for lighter variant
      package = pkgs.kanagawa-gtk-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 12;
    };

    # GTK4 settings
    gtk4.extraConfig = {
      gtk-hint-font-metrics = 1;
    };
  };

  xdg.configFile."gtk-4.0/gtk.css".text = ''
    .navigation-sidebar {
      background-color: #1f1f28;
    }
  '';


  # dconf settings for GNOME applications
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Kanagawa-BL"; # Match the theme name above
      icon-theme = "Papirus-Dark";
      cursor-theme = "Bibata-Modern-Ice";
      cursor-size = 24;
      font-name = "CaskaydiaCove Nerd Font 12";
    };

    "org/gnome/desktop/wm/preferences" = {
      theme = "Kanagawa-BL";
    };

    "org/gnome/nautilus/preferences" = {
      always-use-location-entry = false;
      default-folder-viewer = "list-view";
      default-sort-order = "name";
      search-filter-time-type = "last_modified";
      show-create-link = true;
      show-delete-permanently = true;
      show-directory-item-counts = "on-demand";
      show-image-thumbnails = "local-only";
      thumbnail-limit = 10485760;
      confirm-trash = false;
      enable-delete = true;
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "standard";
      thumbnail-size = 64;
    };

    "org/gnome/nautilus/list-view" = {
      default-column-order = [ "name" "size" "type" "owner" "group" "permissions" "where" "date_modified" "date_modified_with_time" "date_accessed" "recency" "starred" ];
      default-visible-columns = [ "name" "size" "date_modified" ];
      default-zoom-level = "standard";
      use-tree-view = false;
    };

    "org/gnome/nautilus/window-state" = {
      maximized = false;
      sidebar-width = 200;
    };

    "org/gtk/gtk4/Settings/FileChooser" = {
      sort-directories-first = true;
      startup-mode = "recent";
    };

    "org/gnome/desktop/background" = {
      show-desktop-icons = false;
    };

    "org/gnome/desktop/session" = {
      idle-delay = 0;
    };
  };
}
