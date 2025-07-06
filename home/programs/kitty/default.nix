{ userMetaData, ... }:
let
  wallpapers = {
    "kyrielle" = "kristin-lina-1.png";
    "kaluna" = "red-1.png";
    "leshia" = "kristin-lina-2.jpg";
    "silvia" = "kristin-lina-3.png";
  };

  randomWallpaper = wallpapers.${userMetaData.username};
in
{
  programs.kitty = {
    enable = true;
    settings = {
      copy_on_select = true;

      # Background with better blur effect
      background_image = "~/images/${randomWallpaper}";
      background_opacity = "0.85";
      background_image_layout = "scaled";
      background_image_linear = true;
      background_tint = "0.9";
      background_blur = 3;

      # Theme colors - blue sky theme
      foreground = "#E6F3FF";
      background = "#1e2030";
      cursor = "#87CEEB";
      selection_foreground = "#1e2030";
      selection_background = "#87CEEB";

      # Reduced padding for less spacing
      window_padding_width = 3;
      window_margin_width = 2;
      window_border_width = 1;

      # Wayland settings
      linux_display_server = "wayland";
      dynamic_background_opacity = true;

      # Window appearance
      hide_window_decorations = "yes";
      tab_bar_margin_width = 0;
      tab_bar_style = "hidden";

      # Font settings
      font_size = "11.0";

      # Terminal bell
      enable_audio_bell = false;
      visual_bell_duration = "0.0";
    };
  };
}
