{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      copy_on_select = true;

      # Transparent background with blur
      background_opacity = "0.75";
      background_blur = 25;
      background_tint = "0.2";

      # Kanagawa theme colors
      foreground = "#dcd7ba"; # fujiWhite
      background = "#1f1f28"; # sumiInk3
      cursor = "#c8c093"; # oldWhite
      selection_foreground = "#1f1f28"; # sumiInk3
      selection_background = "#c8c093"; # oldWhite

      # Normal colors
      color0 = "#16161d"; # sumiInk0
      color1 = "#c34043"; # autumnRed
      color2 = "#76946a"; # autumnGreen
      color3 = "#c0a36e"; # boatYellow2
      color4 = "#7e9cd8"; # crystalBlue
      color5 = "#957fb8"; # oniViolet
      color6 = "#6a9589"; # waveAqua1
      color7 = "#c8c093"; # oldWhite

      # Bright colors
      color8 = "#727169"; # fujiGray
      color9 = "#e82424"; # samuraiRed
      color10 = "#98bb6c"; # springGreen
      color11 = "#e6c384"; # carpYellow
      color12 = "#7fb4ca"; # springBlue
      color13 = "#938aa9"; # oniViolet2
      color14 = "#7aa89f"; # waveAqua2
      color15 = "#dcd7ba"; # fujiWhite

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
