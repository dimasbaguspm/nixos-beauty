{pkgs, ...}: let
  wallpapers = [
    "red-1.png"
    "kristin-lina-1.png"
    "kristin-lina-2.jpg"
    "kristin-lina-3.png"
  ];

  randomWallpaper = let
    length = builtins.length wallpapers;
    randomInt =
      pkgs.runCommand "random-int" {
        nativeBuildInputs = [pkgs.coreutils];
      } ''
        echo $(($RANDOM % ${toString length})) > $out
      '';
    index = builtins.fromJSON (builtins.readFile randomInt);
  in
    builtins.elemAt wallpapers index;
in {
  programs.kitty = {
    enable = true;
    settings = {
      copy_on_select = true;

      background_image = "~/images/${randomWallpaper}";
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
