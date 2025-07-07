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
    /* Walker theme with glass-like appearance similar to rofi */
    
    @define-color bg-col rgba(10, 10, 20, 0.85);
    @define-color bg-col-light rgba(20, 20, 40, 0.90);
    @define-color bg-col-hover rgba(30, 30, 60, 0.95);
    @define-color border-col rgba(135, 206, 235, 0.8);
    @define-color selected-col rgba(70, 130, 180, 0.9);
    @define-color active-col rgba(91, 167, 212, 0.85);
    @define-color urgent-col rgba(255, 107, 107, 0.9);
    @define-color blue rgba(135, 206, 235, 0.9);
    @define-color fg-col #F0F8FF;
    @define-color fg-col2 rgba(176, 224, 230, 0.9);
    @define-color fg-col3 rgba(135, 206, 235, 0.95);
    @define-color grey rgba(107, 140, 174, 0.8);
    @define-color white #ffffff;

    /* Main window styling */
    #window {
      background-color: @bg-col;
      border: 3px solid @border-col;
      border-radius: 16px;
      padding: 20px;
      margin: 0;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    }

    /* Search input styling */
    #search {
      background-color: @bg-col-light;
      border: 2px solid @border-col;
      border-radius: 12px;
      padding: 15px;
      margin: 0 0 20px 0;
      color: @fg-col;
      font-family: "CaskaydiaCove Nerd Font";
      font-size: 15px;
      box-shadow: inset 0 1px 2px rgba(255, 255, 255, 0.1);
    }

    #search:focus {
      border-color: @blue;
      background-color: @bg-col-hover;
    }

    /* List container */
    #list {
      background-color: transparent;
      margin: 0;
      padding: 0;
    }

    /* List items */
    #item {
      background-color: transparent;
      border-radius: 10px;
      padding: 15px;
      margin: 2px 0;
      color: @fg-col;
      transition: background-color 0.2s ease;
    }

    #item:hover {
      background-color: @bg-col-hover;
    }

    #item:selected {
      background-color: @selected-col;
      color: @white;
      box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2);
    }

    /* Item icons */
    #item image {
      margin-right: 12px;
      -gtk-icon-size: 32px;
    }

    /* Item text */
    #item label {
      color: inherit;
      font-family: "CaskaydiaCove Nerd Font";
      font-size: 13px;
    }

    /* Scrollbar styling */
    scrollbar {
      background-color: @bg-col-light;
      border-radius: 8px;
    }

    scrollbar slider {
      background-color: @border-col;
      border-radius: 8px;
      min-width: 4px;
    }

    scrollbar slider:hover {
      background-color: @blue;
    }

    /* Spinner for loading */
    #spinner {
      color: @blue;
      margin: 10px;
    }

    /* Placeholder text */
    .placeholder {
      color: @grey;
      font-style: italic;
    }

    /* Activation labels */
    .activation-label {
      background-color: @active-col;
      color: @white;
      border-radius: 6px;
      padding: 2px 6px;
      margin-right: 8px;
      font-size: 11px;
      font-weight: bold;
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

    /* Urgent/error items */
    #item.urgent {
      background-color: @urgent-col;
      color: @white;
    }

    /* Active items */
    #item.active {
      background-color: @active-col;
      color: @white;
    }

    /* Sub-text styling */
    #item .sub {
      color: @fg-col2;
      font-size: 11px;
      opacity: 0.8;
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
