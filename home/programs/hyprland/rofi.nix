{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = {
      "*" = {
        bg-col = "#1e2030"; # Dark blue background
        bg-col-light = "#252842"; # Slightly lighter blue
        border-col = "#87CEEB"; # Sky blue border
        selected-col = "#4682B4"; # Steel blue selection
        blue = "#87CEEB"; # Sky blue accent
        fg-col = "#E6F3FF"; # Light blue-white text
        fg-col2 = "#B0E0E6"; # Powder blue secondary text
        grey = "#6B8CAE"; # Blue-grey

        width = 600;
        font = "CaskaydiaCove Nerd Font 14";
      };

      element-text = {
        background-color = "inherit";
        text-color = "inherit";
      };

      element-icon = {
        background-color = "inherit";
      };

      window = {
        height = 360;
        border = 3;
        border-color = "@border-col";
        background-color = "@bg-col";
      };

      mainbox = {
        background-color = "@bg-col";
      };

      inputbar = {
        children = map (e: e) [ "prompt" "entry" ];
        background-color = "@bg-col";
        border-radius = 5;
        padding = 2;
      };

      prompt = {
        background-color = "@blue";
        padding = 6;
        text-color = "@bg-col";
        border-radius = 3;
        margin = "20px 0px 0px 20px";
      };

      textbox-prompt-colon = {
        expand = false;
        str = ":";
      };

      entry = {
        padding = 6;
        margin = "20px 0px 0px 10px";
        text-color = "@fg-col";
        background-color = "@bg-col";
      };

      listview = {
        border = "0px 0px 0px";
        padding = "6px 0px 0px";
        margin = "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = "@bg-col";
      };

      element = {
        padding = 5;
        background-color = "@bg-col";
        text-color = "@fg-col";
      };

      "element-icon" = {
        size = 25;
      };

      "element selected" = {
        background-color = "@selected-col";
        text-color = "@fg-col2";
      };

      mode-switcher = {
        spacing = 0;
      };

      button = {
        padding = 10;
        background-color = "@bg-col-light";
        text-color = "@grey";
        vertical-align = "0.5";
        horizontal-align = "0.5";
      };

      "button selected" = {
        background-color = "@bg-col";
        text-color = "@blue";
      };
    };
  };
}
