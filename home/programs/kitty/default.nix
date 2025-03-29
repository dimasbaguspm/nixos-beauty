{
  programs.kitty = {
    enable = true;
    settings = {
      copy_on_select = true;

      background_image = "~/images/wallpaper.jpg";
      background_opacity = "0.8";
      background_image_layout = "scaled";
      background_image_linear = true;
      background_tint = "0.95";
      background_blur = 1;

      linux_display_server = "x11";
      dynamic_background_opacity = true;

      hide_window_decorations = "yes";
      window_padding_width = 5;
      window_margin_width = 5;
      window_border_width = 0;
      tab_bar_margin_width = 0;
      tab_bar_style = "hidden";
    };
  };
}
