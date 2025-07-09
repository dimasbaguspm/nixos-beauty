{
  # GTK theme configuration to match Hyprland color scheme
  gtk = {
    enable = true;

    # GTK4 settings - using proper format
    gtk4.extraConfig = {
      gtk-hint-font-metrics = 1;
    };
  };

  # GTK4 CSS configuration for modern applications
  xdg.configFile."gtk-4.0/gtk.css".text = ''
    /*
     * Custom GTK4 CSS to match Hyprland color scheme
     * Based on color palette from color.md
     */
    
    /* Color definitions matching Waybar theme exactly */
    @define-color bg_color rgba(0, 0, 8, 0.7);
    @define-color base_color rgba(0, 0, 8, 0.7);
    @define-color text_color #c0caf5;
    @define-color selected_bg_color #13131d;
    @define-color selected_fg_color #cdd6f4;
    @define-color tooltip_bg_color rgba(0, 0, 8, 0.9);
    @define-color tooltip_fg_color #c0caf5;
    @define-color theme_bg_color rgba(0, 0, 8, 0.7);
    @define-color theme_fg_color #c0caf5;
    @define-color theme_base_color rgba(0, 0, 8, 0.7);
    @define-color theme_text_color #c0caf5;
    @define-color theme_selected_bg_color #13131d;
    @define-color theme_selected_fg_color #cdd6f4;
    @define-color accent_color #1793d1;
    @define-color accent_bg_color #1793d1;
    @define-color accent_fg_color #c0caf5;
    @define-color destructive_color #f7768e;
    @define-color warning_color #f7768e;
    @define-color error_color #f7768e;
    @define-color success_color #9ece6a;
    @define-color border_color rgba(192, 202, 245, 0.2);
    @define-color hover_color rgba(26, 27, 38, 0.9);
    @define-color workspace_hover_color #11111b;
    
    /* Window styling */
    window {
      background-color: @bg_color;
      color: @text_color;
      border-radius: 12px;
    }
    
    /* Nautilus specific styling */
    .nautilus-window {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window headerbar {
      background-color: @bg_color;
      color: @text_color;
      border-radius: 12px 12px 0 0;
      box-shadow: none;
      border: none;
    }
    
    .nautilus-window headerbar button {
      background-color: transparent;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 8px;
      margin: 2px;
    }
    
    .nautilus-window headerbar button:hover {
      background-color: @hover_color;
      border-color: @accent_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window headerbar button:active {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Sidebar styling - force dark theme for GTK4 */
    .nautilus-window .sidebar {
      background-color: @bg_color;
      color: @text_color;
      border-right: 1px solid @border_color;
      border-radius: 0 0 0 12px;
      padding: 0;
    }
    
    /* Force sidebar background on all child elements in GTK4 */
    .nautilus-window .sidebar * {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window .sidebar viewport {
      background-color: @bg_color;
    }
    
    .nautilus-window .sidebar scrolledwindow {
      background-color: @bg_color;
    }
    
    .nautilus-window .sidebar box {
      background-color: @bg_color;
    }
    
    .nautilus-window .sidebar list {
      background-color: @bg_color;
    }
    
    .nautilus-window .sidebar listbox {
      background-color: @bg_color;
    }
    
    .nautilus-window .sidebar listboxrow {
      background-color: transparent;
      color: @text_color;
      border-radius: 0;
      margin: 0;
      padding: 8px 12px;
      transition: all 0.3s ease-out;
      border: none;
    }
    
    .nautilus-window .sidebar listboxrow:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
      border: none;
    }
    
    .nautilus-window .sidebar listboxrow:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
      border: none;
    }
    
    /* Additional sidebar selectors for comprehensive coverage in GTK4 */
    .nautilus-window placessidebar {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window placessidebar * {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window placessidebar list {
      background-color: @bg_color;
    }
    
    .nautilus-window placessidebar listbox {
      background-color: @bg_color;
    }
    
    .nautilus-window placessidebar row {
      background-color: transparent;
      color: @text_color;
      border-radius: 0;
      margin: 0;
      padding: 8px 12px;
      transition: all 0.3s ease-out;
      border: none;
    }
    
    .nautilus-window placessidebar row:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
      border: none;
    }
    
    .nautilus-window placessidebar row:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
      border: none;
    }
    
    /* Sidebar for GTK4 - additional selectors */
    .nautilus-window .places-sidebar {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window .places-sidebar * {
      background-color: @bg_color;
      color: @text_color;
    }
    
    /* Sidebar labels in GTK4 */
    .nautilus-window .sidebar label {
      color: inherit;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
      margin-left: 8px;
    }
    
    /* Sidebar icons in GTK4 */
    .nautilus-window .sidebar image {
      margin-right: 8px;
      opacity: 0.8;
    }
    
    .nautilus-window .sidebar listboxrow:hover image {
      opacity: 1;
    }
    
    /* Main content area - list view */
    .nautilus-window .nautilus-list-view {
      background-color: @bg_color;
      color: @text_color;
      border-radius: 0 0 12px 0;
      padding: 0;
    }
    
    .nautilus-window .nautilus-list-view treeview {
      background-color: @bg_color;
      color: @text_color;
      border-radius: 0;
    }
    
    .nautilus-window .nautilus-list-view treeview.view {
      background-color: @bg_color;
      color: @text_color;
      border-radius: 0;
    }
    
    /* List view headers - no margin/border-radius */
    .nautilus-window .nautilus-list-view treeview.view header {
      background-color: @bg_color;
      color: @text_color;
      border: none;
      border-radius: 0;
      margin: 0;
      padding: 8px 12px;
      border-bottom: 1px solid @border_color;
    }
    
    .nautilus-window .nautilus-list-view treeview.view header button {
      background-color: transparent;
      color: @text_color;
      border: none;
      border-radius: 0;
      margin: 0;
      padding: 0;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
      font-weight: 500;
    }
    
    .nautilus-window .nautilus-list-view treeview.view header button:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    /* List view separators */
    .nautilus-window .nautilus-list-view treeview.view:not(:first-child) {
      border-top: 1px solid @border_color;
    }
    
    /* List view column separators */
    .nautilus-window .nautilus-list-view treeview.view separator {
      background-color: @border_color;
      min-width: 1px;
    }
    
    .nautilus-window .nautilus-list-view row {
      background-color: transparent;
      color: @text_color;
      border-radius: 0;
      margin: 0;
      padding: 8px 12px;
      transition: all 0.3s ease-out;
      border-bottom: 1px solid rgba(192, 202, 245, 0.1);
    }
    
    .nautilus-window .nautilus-list-view row:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window .nautilus-list-view row:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Icon view styling - match list view consistency */
    .nautilus-window .nautilus-icon-view {
      background-color: @bg_color;
      color: @text_color;
      padding: 12px;
      border-radius: 0 0 12px 0;
    }
    
    /* Force background color on all icon view child elements */
    .nautilus-window .nautilus-icon-view * {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window .nautilus-icon-view viewport {
      background-color: @bg_color;
    }
    
    .nautilus-window .nautilus-icon-view scrolledwindow {
      background-color: @bg_color;
    }
    
    .nautilus-window .nautilus-icon-view .nautilus-icon {
      color: @text_color;
      background-color: transparent;
      border-radius: 0;
      padding: 8px;
      margin: 0;
      transition: all 0.3s ease-out;
      border-bottom: 1px solid rgba(192, 202, 245, 0.1);
    }
    
    .nautilus-window .nautilus-icon-view .nautilus-icon:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window .nautilus-icon-view .nautilus-icon:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Grid view items - match list view consistency */
    .nautilus-window .nautilus-grid-view {
      background-color: @bg_color;
      color: @text_color;
      padding: 12px;
      border-radius: 0 0 12px 0;
    }
    
    /* Force background color on all grid view child elements */
    .nautilus-window .nautilus-grid-view * {
      background-color: @bg_color;
      color: @text_color;
    }
    
    .nautilus-window .nautilus-grid-view viewport {
      background-color: @bg_color;
    }
    
    .nautilus-window .nautilus-grid-view scrolledwindow {
      background-color: @bg_color;
    }
    
    .nautilus-window .nautilus-grid-view .nautilus-icon {
      color: @text_color;
      background-color: transparent;
      border-radius: 0;
      padding: 8px;
      margin: 0;
      transition: all 0.3s ease-out;
      border-bottom: 1px solid rgba(192, 202, 245, 0.1);
    }
    
    .nautilus-window .nautilus-grid-view .nautilus-icon:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window .nautilus-grid-view .nautilus-icon:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Icon view rubberband selection */
    .nautilus-window .nautilus-icon-view .rubberband,
    .nautilus-window .nautilus-grid-view .rubberband {
      background-color: @accent_color;
      opacity: 0.3;
      border: 1px solid @accent_color;
      border-radius: 4px;
    }
    
    /* Icon view file/folder labels - match list view consistency */
    .nautilus-window .nautilus-icon-view .nautilus-icon label,
    .nautilus-window .nautilus-grid-view .nautilus-icon label {
      color: @text_color;
      background-color: transparent;
      border-radius: 0;
      padding: 4px 8px;
      margin: 0;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 11px;
    }
    
    .nautilus-window .nautilus-icon-view .nautilus-icon:hover label,
    .nautilus-window .nautilus-grid-view .nautilus-icon:hover label {
      color: @selected_fg_color;
    }
    
    .nautilus-window .nautilus-icon-view .nautilus-icon:selected label,
    .nautilus-window .nautilus-grid-view .nautilus-icon:selected label {
      color: @selected_fg_color;
      background-color: transparent;
      border-radius: 0;
    }
    
    /* Pathbar styling - match Waybar modules */
    .nautilus-window .path-bar {
      background-color: @bg_color;
      border-radius: 12px;
      margin: 4px;
      padding: 4px;
    }
    
    .nautilus-window .path-bar button {
      background-color: transparent;
      border: none;
      color: @text_color;
      border-radius: 12px;
      padding: 8px 12px;
      margin: 0 2px;
      transition: all 0.3s ease-out;
    }
    
    .nautilus-window .path-bar button:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window .path-bar button:active {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Search and filter styling - match Waybar modules */
    .nautilus-window searchbar {
      border-radius: 12px;
    }
    
    .nautilus-window searchbar entry {
      border-radius: 12px;
      color: @text_color;
      transition: all 0.3s ease-out;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
    }
    
    .nautilus-window searchbar entry:focus {
      border-color: @accent_color;
      background-color: @hover_color;
      color: @selected_fg_color;
      box-shadow: 0 0 0 2px rgba(23, 147, 209, 0.2);
    }
    
    .nautilus-window searchbar button {
      background-color: transparent;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      transition: all 0.3s ease-out;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
    }
    
    .nautilus-window searchbar button:hover {
      background-color: @hover_color;
      border-color: @accent_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window searchbar button:active,
    .nautilus-window searchbar button:checked {
      background-color: @selected_bg_color;
      border-color: @accent_color;
      color: @selected_fg_color;
    }
    
    /* Search suggestions/dropdown */
    .nautilus-window searchbar popover {
      background-color: @bg_color;
      border: 1px solid @border_color;
      border-radius: 12px;
      padding: 4px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    }
    
    .nautilus-window searchbar popover listbox {
      background-color: transparent;
    }
    
    .nautilus-window searchbar popover listbox row {
      background-color: transparent;
      color: @text_color;
      transition: all 0.3s ease-out;
    }
    
    .nautilus-window searchbar popover listbox row:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window searchbar popover listbox row:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }

    /* Toolbar styling - match Waybar modules */
    .nautilus-window toolbar {
      background-color: @bg_color;
      border: none;
      box-shadow: none;
      border-radius: 12px;
      margin: 4px;
      padding: 4px;
    }
    
    .nautilus-window toolbar button {
      background-color: transparent;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 8px 12px;
      margin: 0 2px;
      transition: all 0.3s ease-out;
    }
    
    .nautilus-window toolbar button:hover {
      background-color: @hover_color;
      border-color: @accent_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window toolbar button:active {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Context menu styling - match Waybar modules */
    .nautilus-window menu {
      background-color: @bg_color;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 4px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    }
    
    .nautilus-window menu menuitem {
      background-color: transparent;
      border-radius: 12px;
      color: @text_color;
      padding: 8px 12px;
      margin: 2px;
      transition: all 0.3s ease-out;
    }
    
    .nautilus-window menu menuitem:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    .nautilus-window menu menuitem:selected {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    /* Statusbar styling - match Waybar modules */
    .nautilus-window statusbar {
      background-color: @bg_color;
      color: @text_color;
      border-top: 1px solid @border_color;
      border-radius: 0 0 12px 12px;
      padding: 8px;
    }
    
    /* Scrollbars */
    .nautilus-window scrollbar {
      background-color: transparent;
    }
    
    .nautilus-window scrollbar slider {
      background-color: @border_color;
      border-radius: 12px;
      margin: 2px;
      min-width: 12px;
      min-height: 12px;
    }
    
    .nautilus-window scrollbar slider:hover {
      background-color: @accent_color;
    }
    
    .nautilus-window scrollbar slider:active {
      background-color: @selected_bg_color;
    }
    
    /* General GTK widget styling */
    button {
      background-color: transparent;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 8px 12px;
      margin: 2px;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
      transition: all 0.3s ease-out;
    }
    
    button:hover {
      background-color: @hover_color;
      border-color: @accent_color;
      color: @selected_fg_color;
    }
    
    button:active {
      background-color: @selected_bg_color;
      color: @selected_fg_color;
    }
    
    entry {
      background-color: @bg_color;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 8px 12px;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
      transition: all 0.3s ease-out;
    }
    
    entry:focus {
      border-color: @accent_color;
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    /* Tooltip styling - match Waybar modules */
    tooltip {
      background-color: @bg_color;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @tooltip_fg_color;
      padding: 8px;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 11px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    }
    
    /* Menu styling - match Waybar modules */
    menu {
      background-color: @bg_color;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 4px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    }
    
    menu menuitem {
      background-color: transparent;
      border-radius: 12px;
      color: @text_color;
      padding: 8px 12px;
      margin: 2px;
      transition: all 0.3s ease-out;
    }
    
    menu menuitem:hover {
      background-color: @hover_color;
      color: @selected_fg_color;
    }
    
    /* Popover styling - match Waybar modules */
    popover {
      background-color: @bg_color;
      border: 1px solid @border_color;
      border-radius: 12px;
      color: @text_color;
      padding: 8px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    }
  '';



  # dconf settings for GNOME applications
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Bibata-Modern-Ice";
      cursor-size = 24;
      font-name = "CaskaydiaCove Nerd Font 12";
    };

    "org/gnome/desktop/wm/preferences" = {
      theme = "Adwaita";
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
      # Disable trash to prevent crashes
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

    # Fix desktop integration issues
    "org/gnome/desktop/background" = {
      show-desktop-icons = false;
    };

    "org/gnome/desktop/session" = {
      idle-delay = 0;
    };
  };
}
