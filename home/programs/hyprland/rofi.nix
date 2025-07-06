{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    # Enhanced configuration
    extraConfig = {
      modi = "drun,run,window,ssh";
      show-icons = true;
      icon-theme = "Papirus";
      display-drun = "🚀 Apps";
      display-run = "💻 Commands";
      display-window = "🪟 Windows";
      display-ssh = "🔗 SSH";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = false;
      matching = "fuzzy";
      sort = true;
      sorting-method = "fzf";
      case-sensitive = false;
      cycle = true;
      click-to-exit = true;
      mouse-actions = true;
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      kb-accept-entry = "Return,KP_Enter";
      kb-remove-to-eol = "Control+shift+e";
      kb-move-char-back = "Left,Control+b";
      kb-move-char-forward = "Right,Control+f";
      kb-remove-char-forward = "Delete,Control+d";
      kb-remove-char-back = "BackSpace,Shift+BackSpace,Control+h";
      kb-row-up = "Up,Control+p";
      kb-row-down = "Down,Control+n";
      kb-row-tab = "";
      kb-element-next = "";
      kb-element-prev = "Shift+Tab";
      kb-page-prev = "Page_Up";
      kb-page-next = "Page_Down";
      kb-row-first = "Home,KP_Home";
      kb-row-last = "End,KP_End";
      kb-cancel = "Escape,Control+g,Control+bracketleft";
    };

    theme = {
      "*" = {
        bg-col = "rgba(10, 10, 20, 0.85)"; # Dark translucent background for glass effect
        bg-col-light = "rgba(20, 20, 40, 0.90)"; # Slightly lighter translucent
        bg-col-hover = "rgba(30, 30, 60, 0.95)"; # Hover background with glass effect
        border-col = "rgba(135, 206, 235, 0.8)"; # Semi-transparent sky blue border
        selected-col = "rgba(70, 130, 180, 0.9)"; # Glass steel blue selection
        active-col = "rgba(91, 167, 212, 0.85)"; # Translucent active element
        urgent-col = "rgba(255, 107, 107, 0.9)"; # Translucent urgent/error color
        blue = "rgba(135, 206, 235, 0.9)"; # Glass sky blue accent
        fg-col = "#F0F8FF"; # Bright alice blue text for contrast
        fg-col2 = "rgba(176, 224, 230, 0.9)"; # Semi-transparent powder blue
        fg-col3 = "rgba(135, 206, 235, 0.95)"; # Glass accent text
        grey = "rgba(107, 140, 174, 0.8)"; # Translucent blue-grey
        white = "#ffffff";
        transparent = "rgba(0,0,0,0)";

        width = 800;
        font = "CaskaydiaCove Nerd Font 15";
        border-radius = 16; # Increased for more modern glass look
      };



      window = {
        height = 500;
        border = 3; # Thicker border for glass effect
        border-color = "@border-col";
        background-color = "@bg-col";
        border-radius = 16; # Increased border radius
        padding = 0;
        transparency = "real";
        # Add blur and shadow effects for glass appearance
        box-shadow = "0 20px 40px rgba(0, 0, 0, 0.3)";
      };

      mainbox = {
        background-color = "@bg-col";
        spacing = 0;
        border-radius = 16;
        padding = 20; # Increased padding for better glass effect
      };

      inputbar = {
        children = map (e: e) [ "prompt" "entry" ];
        background-color = "@bg-col-light";
        border-radius = 12;
        padding = 15; # Increased padding
        margin = "0 0 20 0"; # Increased margin
        border = 2; # Thicker border
        border-color = "@border-col";
        # Add subtle inner glow effect
        box-shadow = "inset 0 1px 2px rgba(255, 255, 255, 0.1)";
      };

      prompt = {
        background-color = "@transparent";
        padding = "0 12 0 0";
        text-color = "@blue";
        font = "CaskaydiaCove Nerd Font Bold 15";
      };

      textbox-prompt-colon = {
        expand = false;
        str = ":";
      };

      entry = {
        padding = "0";
        text-color = "@fg-col";
        background-color = "@transparent";
        placeholder = "Search applications...";
        placeholder-color = "@grey";
        cursor = "text";
      };

      listview = {
        border = "0";
        padding = "0";
        margin = "0";
        columns = 1;
        lines = 8;
        background-color = "@transparent";
        spacing = 4;
        scrollbar = false;
        fixed-height = true;
        dynamic = true;
        reverse = false;
        cycle = true;
      };

      element = {
        padding = 15; # Increased padding
        background-color = "@transparent";
        text-color = "@fg-col";
        border-radius = 10; # Increased border radius
        spacing = 15; # Increased spacing
        orientation = "horizontal";
        # Add subtle hover transition effect
        transition = "background-color 0.2s ease";
      };

      "element normal.normal" = {
        background-color = "@transparent";
        text-color = "@fg-col";
      };

      "element normal.urgent" = {
        background-color = "@urgent-col";
        text-color = "@fg-col";
      };

      "element normal.active" = {
        background-color = "@active-col";
        text-color = "@bg-col";
      };

      "element selected.normal" = {
        background-color = "@selected-col";
        text-color = "@white";
        border-radius = 10;
        # Add glass-like inner highlight
        box-shadow = "inset 0 1px 0 rgba(255, 255, 255, 0.2)";
      };

      "element selected.urgent" = {
        background-color = "@urgent-col";
        text-color = "@white";
      };

      "element selected.active" = {
        background-color = "@active-col";
        text-color = "@bg-col";
      };

      "element alternate.normal" = {
        background-color = "@transparent";
        text-color = "@fg-col";
      };

      "element alternate.urgent" = {
        background-color = "@urgent-col";
        text-color = "@fg-col";
      };

      "element alternate.active" = {
        background-color = "@active-col";
        text-color = "@bg-col";
      };

      "element-icon" = {
        size = 32;
        background-color = "@transparent";
        text-color = "inherit";
        cursor = "inherit";
      };

      "element-text" = {
        background-color = "@transparent";
        text-color = "inherit";
        cursor = "inherit";
        highlight = "bold #87CEEB";
      };

      # Scrollbar styling
      scrollbar = {
        width = 4;
        border = 0;
        handle-color = "@border-col";
        handle-width = 4;
        padding = 0;
        background-color = "@bg-col-light";
      };

      # Mode switcher (if using multiple modes)
      mode-switcher = {
        spacing = 0;
        background-color = "@bg-col-light";
        border-radius = 12; # Increased border radius
        margin = "20 0 0 0"; # Increased margin
        padding = 6; # Increased padding
        border = 1;
        border-color = "@border-col";
      };

      button = {
        padding = "10 20"; # Increased padding
        background-color = "@transparent";
        text-color = "@grey";
        border-radius = 8; # Increased border radius
        font = "CaskaydiaCove Nerd Font 13";
        transition = "all 0.2s ease";
      };

      "button selected" = {
        background-color = "@selected-col";
        text-color = "@white";
        box-shadow = "0 2px 8px rgba(70, 130, 180, 0.3)";
      };

      # Message styling for errors/info
      message = {
        padding = 15; # Increased padding
        border-radius = 12; # Increased border radius
        background-color = "@bg-col-light";
        border = 2; # Thicker border
        border-color = "@border-col";
        margin = "0 0 20 0"; # Increased margin
        box-shadow = "0 4px 12px rgba(0, 0, 0, 0.2)";
      };

      textbox = {
        padding = 10; # Increased padding
        background-color = "@transparent";
        text-color = "@fg-col";
      };

      # Error message styling
      error-message = {
        padding = 15; # Increased padding
        border-radius = 12; # Increased border radius
        background-color = "@urgent-col";
        border = 2; # Thicker border
        border-color = "@urgent-col";
        margin = "0 0 20 0"; # Increased margin
        box-shadow = "0 4px 12px rgba(255, 107, 107, 0.3)";
      };
    };
  };
}
