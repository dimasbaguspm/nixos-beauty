{ ... }:
{
  # Walker configuration using home-manager
  xdg.configFile."walker/config.toml".text = ''
    # Walker configuration
    app_launch_prefix = ""
    terminal_title_flag = ""
    locale = ""
    close_when_open = false
    theme = "walker"
    monitor = ""
    hotreload_theme = false
    as_window = false
    timeout = 0
    disable_click_to_close = false
    force_keyboard_focus = false
    terminal = "kitty"

    # Key bindings
    [keys]
    accept_typeahead = ["tab"]
    trigger_labels = "lalt"
    next = ["down"]
    prev = ["up"]
    close = ["esc"]
    remove_from_history = ["shift backspace"]
    resume_query = ["ctrl r"]
    toggle_exact_search = ["ctrl m"]

    [keys.activation_modifiers]
    keep_open = "shift"
    alternate = "alt"

    [keys.ai]
    clear_session = ["ctrl x"]
    copy_last_response = ["ctrl c"]
    resume_session = ["ctrl r"]
    run_last_response = ["ctrl e"]

    # Events
    [events]
    on_activate = ""
    on_selection = ""
    on_exit = ""
    on_launch = ""
    on_query_change = ""

    # List configuration
    [list]
    dynamic_sub = true
    keyboard_scroll_style = "emacs"
    max_entries = 8
    show_initial_entries = true
    single_click = true
    visibility_threshold = 20
    placeholder = "No Results"

    # Search configuration
    [search]
    argument_delimiter = "#"
    placeholder = "Search..."
    delay = 0
    resume_last_query = false

    # Activation mode
    [activation_mode]
    labels = "jkl;asdf"

    # Builtin modules configuration
    [builtins.applications]
    weight = 5
    name = "applications"
    placeholder = "Applications"
    prioritize_new = true
    hide_actions_with_empty_query = true
    context_aware = true
    refresh = true
    show_sub_when_single = true
    show_icon_when_single = true
    show_generic = true
    history = true

    [builtins.applications.actions]
    enabled = true
    hide_category = false
    hide_without_query = true

    [builtins.runner]
    eager_loading = true
    weight = 5
    icon = "utilities-terminal"
    name = "runner"
    placeholder = "Runner"
    typeahead = true
    history = true
    generic_entry = false
    refresh = true
    use_fd = false

    [builtins.windows]
    weight = 5
    icon = "view-restore"
    name = "windows"
    placeholder = "Windows"
    show_icon_when_single = true

    [builtins.clipboard]
    always_put_new_on_top = true
    exec = "wl-copy"
    weight = 5
    name = "clipboard"
    avoid_line_breaks = true
    placeholder = "Clipboard"
    image_height = 300
    max_entries = 50
    switcher_only = true

    [builtins.emojis]
    exec = "wl-copy"
    weight = 5
    name = "emojis"
    placeholder = "Emojis"
    switcher_only = true
    history = true
    typeahead = true
    show_unqualified = false

    [builtins.symbols]
    after_copy = ""
    weight = 5
    name = "symbols"
    placeholder = "Symbols"
    switcher_only = true
    history = true
    typeahead = true

    [builtins.calc]
    require_number = true
    weight = 5
    name = "calc"
    icon = "accessories-calculator"
    placeholder = "Calculator"
    min_chars = 4

    [builtins.ssh]
    weight = 5
    icon = "preferences-system-network"
    name = "ssh"
    placeholder = "SSH"
    switcher_only = true
    history = true
    refresh = true

    [builtins.finder]
    use_fd = false
    fd_flags = "--ignore-vcs --type file"
    weight = 5
    icon = "file"
    name = "finder"
    placeholder = "Finder"
    switcher_only = true
    ignore_gitignore = true
    refresh = true
    concurrency = 8
    show_icon_when_single = true
    preview_images = false

    [builtins.websearch]
    keep_selection = true
    weight = 5
    icon = "applications-internet"
    name = "websearch"
    placeholder = "Websearch"
    switcher_only = true

    [[builtins.websearch.entries]]
    name = "Google"
    url = "https://www.google.com/search?q=%TERM%"

    [[builtins.websearch.entries]]
    name = "DuckDuckGo"
    url = "https://duckduckgo.com/?q=%TERM%"
    switcher_only = true

    [builtins.commands]
    weight = 5
    icon = "utilities-terminal"
    switcher_only = true
    name = "commands"
    placeholder = "Commands"

    [builtins.custom_commands]
    weight = 5
    icon = "utilities-terminal"
    name = "custom_commands"
    placeholder = "Custom Commands"

    [builtins.switcher]
    weight = 5
    name = "switcher"
    placeholder = "Switcher"
    prefix = "/"
  '';

  # Walker theme CSS file
  xdg.configFile."walker/themes/walker.css".text = ''
    /* Walker theme using official Kanagawa GTK variables */
    
    /* Import official Kanagawa GTK color variables */
    @define-color theme_bg_color #1f1f28;
    @define-color theme_fg_color #dcd7ba;
    @define-color theme_base_color #1f1f28;
    @define-color theme_text_color #dcd7ba;
    @define-color theme_selected_bg_color #c8c093;
    @define-color theme_selected_fg_color rgba(0, 0, 0, 0.87);
    @define-color accent_bg_color #c8c093;
    @define-color accent_color #c8c093;
    @define-color borders rgba(220, 215, 186, 0.12);
    @define-color warning_color #FDD633;
    @define-color error_color #F28B82;
    @define-color success_color #81C995;
    
    /* Walker-specific colors based on Kanagawa GTK */
    @define-color bg-col rgba(31, 31, 40, 0.95);          /* theme_bg_color with transparency */
    @define-color bg-col-light rgba(31, 31, 40, 0.9);     /* theme_base_color */
    @define-color bg-col-hover rgba(200, 192, 147, 0.1);  /* accent_color with low opacity */
    @define-color border-col rgba(220, 215, 186, 0.12);   /* borders */
    @define-color selected-col #c8c093;                   /* theme_selected_bg_color */
    @define-color active-col rgba(200, 192, 147, 0.2);    /* accent_color with transparency */
    @define-color urgent-col #F28B82;                     /* error_color */
    @define-color blue #c8c093;                           /* accent_color */
    @define-color fg-col #dcd7ba;                         /* theme_fg_color */
    @define-color fg-col2 #c8c093;                        /* accent_color */
    @define-color fg-col3 #c8c093;                        /* accent_color */
    @define-color grey rgba(220, 215, 186, 0.5);          /* theme_fg_color with transparency */
    @define-color white #ffffff;
    @define-color yellow #FDD633;                         /* warning_color - for icons */

    /* Main window styling - matching GTK dialog/popover */
    #window {
      background-color: @theme_bg_color;
      border: 1px solid @borders;
      border-radius: 6px;
      padding: 16px;
      margin: 0;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2), 0 0 0 1px rgba(220, 215, 186, 0.05);
    }

    /* Search input styling - matching GTK entry */
    #search {
      background-color: @theme_base_color;
      border: 1px solid @borders;
      border-radius: 6px;
      padding: 12px;
      margin: 0 0 16px 0;
      color: @theme_text_color;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
      transition: all .2s ease-out;
      box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    }

    #search:focus {
      border-color: @accent_color;
      background-color: @theme_base_color;
      color: @theme_text_color;
      box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 0 0 1px @accent_color;
    }

    /* List container */
    #list {
      background-color: transparent;
      margin: 0;
      padding: 0;
    }

    /* List items - matching GTK list/tree view styling */
    #item {
      background-color: transparent;
      border-radius: 6px;
      padding: 8px 12px;
      margin: 1px 0;
      color: @theme_text_color;
      transition: all .15s ease-out;
      border: 1px solid transparent;
    }

    #item:hover {
      background-color: @bg-col-hover;
      color: @theme_text_color;
      border-color: @borders;
    }

    #item:selected {
      background-color: @theme_selected_bg_color;
      color: @theme_selected_fg_color;
      border-color: @accent_color;
    }

    /* Item icons - using yellow accent like Nautilus */
    #item image {
      margin-right: 12px;
      -gtk-icon-size: 32px;
      color: @yellow;
      -gtk-icon-style: symbolic;
    }

    /* Special styling for different item types */
    #item.application image {
      color: @yellow;
    }

    #item.file image {
      color: @accent_color;
    }

    #item.folder image {
      color: @success_color;
    }

    /* Item text */
    #item label {
      color: inherit;
      font-family: "CaskaydiaCove Nerd Font", sans-serif;
      font-size: 12px;
    }

    /* Scrollbar styling - matching GTK scrollbar */
    scrollbar {
      background-color: transparent;
      border-radius: 6px;
      margin: 2px;
    }

    scrollbar slider {
      background-color: @borders;
      border-radius: 6px;
      min-width: 6px;
      min-height: 6px;
      margin: 2px;
      transition: background-color .15s ease-out;
    }

    scrollbar slider:hover {
      background-color: @accent_color;
    }

    scrollbar slider:active {
      background-color: @accent_color;
    }

    /* Spinner for loading - using accent color */
    #spinner {
      color: @accent_color;
      margin: 8px;
    }

    /* Placeholder text - matching GTK placeholder */
    .placeholder {
      color: @grey;
      font-style: italic;
    }

    /* Activation labels - matching GTK button styling */
    .activation-label {
      background-color: @theme_selected_bg_color;
      color: @theme_selected_fg_color;
      border-radius: 4px;
      padding: 2px 6px;
      margin-right: 8px;
      font-size: 10px;
      font-weight: bold;
      border: 1px solid @borders;
    }

    /* Module-specific styling */
    #window.applications {}
    #window.runner {}
    #window.windows {}
    #window.clipboard {}
    #window.emojis {}
    #window.symbols {}
    #window.calc {}
    #window.ssh {}
    #window.finder {}
    #window.websearch {}

    /* Urgent/error items - using GTK error color */
    #item.urgent {
      background-color: @error_color;
      color: rgba(0, 0, 0, 0.87);
    }

    /* Active items - using GTK accent */
    #item.active {
      background-color: @active-col;
      color: @theme_text_color;
    }

    /* Sub-text styling - matching GTK dim labels */
    #item .sub {
      color: @grey;
      font-size: 10px;
      opacity: 0.7;
    }

    /* Additional Nautilus-inspired styling */
    #item.directory image {
      color: @success_color;
    }

    #item.executable image {
      color: @warning_color;
    }

    #item.document image {
      color: @accent_color;
    }
  '';

  # Walker theme layout file
  xdg.configFile."walker/themes/walker.json".text = ''
    {
      "anchors": {
        "top": true,
        "left": true,
        "right": true,
        "bottom": false
      },
      "window": {
        "width": 800,
        "height": 500,
        "box": {
          "orientation": "vertical",
          "spacing": 0,
          "search": {
            "orientation": "horizontal",
            "spacing": 10,
            "margins": {
              "bottom": 20
            },
            "input": {
              "h_expand": true
            },
            "spinner": {
              "hide": false
            }
          },
          "scroll": {
            "h_expand": true,
            "v_expand": true,
            "list": {
              "orientation": "vertical",
              "spacing": 4,
              "item": {
                "orientation": "horizontal",
                "spacing": 15,
                "margins": {
                  "top": 2,
                  "bottom": 2
                },
                "icon": {
                  "icon_size": "large",
                  "pixel_size": 32
                },
                "text": {
                  "orientation": "vertical",
                  "spacing": 2,
                  "h_expand": true,
                  "label": {
                    "justify": "left",
                    "x_align": 0.0
                  },
                  "sub": {
                    "justify": "left",
                    "x_align": 0.0,
                    "opacity": 0.8
                  }
                },
                "activation_label": {
                  "margins": {
                    "start": 8,
                    "end": 8
                  }
                }
              }
            }
          }
        }
      }
    }
  '';
}
