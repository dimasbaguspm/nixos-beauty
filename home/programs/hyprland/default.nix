{ userMetaData, ... }:
let
  wallpapers = {
    "kyrielle" = "kristin-lina-1.png";
    "kaluna" = "red-1.png";
    "leshia" = "kristin-lina-2.jpg";
    "silvia" = "kristin-lina-3.png";
  };

  userWallpaper = wallpapers.${userMetaData.username};
in
{
  imports = [
    ./waybar.nix
    ./walker.nix
    ./dunst.nix
    ./wlogout.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Optional: Enable systemd integration
    systemd.enable = true;

    settings = {
      # Monitor configuration
      monitor = [
        ",preferred,auto,auto"
      ];

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      # Input configuration
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0;
      };

      # General settings
      general = {
        gaps_in = 2;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(e6c384ff) rgba(7e9cd8ff) 45deg"; # Kanagawa carpYellow to crystalBlue gradient
        "col.inactive_border" = "rgba(54546dff)"; # Kanagawa sumiInk6 for inactive borders

        layout = "master";
        allow_tearing = false;
      };

      # Decoration settings
      decoration = {
        rounding = 12;

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          vibrancy = 0.2;
        };
      };

      # Animation settings
      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default, loop" # Animated rotating border
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Layout settings
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master"; # master: new window becomes master; slave: new windows are added to slave stack; inherit: inherit from focused window
        new_on_top = false; # whether a newly open window should be on the top of the stack
        new_on_active = "none"; # before, after: place new window relative to the focused window; none: use new_on_top value

        mfact = 0.65; # master window takes 65% of screen width

        orientation = "left"; # master area on left, slaves on right (left, right, top, bottom, center)
        inherit_fullscreen = true; # inherit fullscreen status when cycling/swapping windows
        always_keep_position = false; # keep master in position when no slave windows

        slave_count_for_center_master = 2; # minimum slaves needed for center master layout
        center_master_fallback = "left"; # fallback when not enough slaves for center mode

        allow_small_split = false; # enable additional master windows in horizontal split
        smart_resizing = true; # resizing direction based on mouse position
        drop_at_cursor = true; # drag and drop windows at cursor position
        special_scale_factor = 1.0; # scale factor for special workspace windows
      };

      # Gestures
      gestures = {
        workspace_swipe = false;
      };

      # Misc settings
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      # Window rules
      windowrulev2 = [
        "float, class:^(nautilus)$"
        "float, class:^(pavucontrol)$"
        "float, class:^(walker)$"
        "size 800 600, class:^(nautilus)$"
        "center, class:^(nautilus)$"
        "float, class:^(wlogout)$"
        "center, class:^(wlogout)$"
        "size 480 320, class:^(wlogout)$"
        # Additional nautilus styling rules
        "opacity 0.95 0.95, class:^(nautilus)$"
        "rounding 12, class:^(nautilus)$"
        "noshadow, class:^(nautilus)$"
        "noborder, class:^(nautilus)$"
      ];

      # Key bindings
      "$mainMod" = "SUPER";

      bind = [
        # Application launches
        "$mainMod, Q, exec, kitty"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, walker"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod SHIFT, L, exec, hyprctl keyword general:layout master" # switch to master layout
        "$mainMod SHIFT, D, exec, hyprctl keyword general:layout dwindle" # switch to dwindle layout

        # Quick actions
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, T, togglegroup,"
        "$mainMod, Tab, changegroupactive,"
        "$mainMod SHIFT, R, exec, hyprctl reload"

        # Audio controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Brightness controls
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        # Master Layout specific bindings
        "$mainMod, Return, layoutmsg, swapwithmaster auto" # swap focused window with master
        "$mainMod SHIFT, Return, layoutmsg, focusmaster auto" # focus the master window
        "$mainMod CTRL, Return, layoutmsg, cyclenext" # cycle through windows respecting layout
        "$mainMod SHIFT CTRL, Return, layoutmsg, cycleprev" # cycle previous respecting layout

        # Master layout manipulation
        "$mainMod, equal, layoutmsg, addmaster" # add a master window
        "$mainMod, minus, layoutmsg, removemaster" # remove a master window
        "$mainMod SHIFT, equal, layoutmsg, mfact exact 0.65" # reset master factor to default
        "$mainMod SHIFT, minus, layoutmsg, mfact exact 0.5" # set master factor to 50%
        "$mainMod, bracketleft, layoutmsg, mfact -0.05" # decrease master size
        "$mainMod, bracketright, layoutmsg, mfact +0.05" # increase master size

        # Layout orientation controls
        "$mainMod SHIFT, h, layoutmsg, orientationleft" # master on left
        "$mainMod SHIFT, l, layoutmsg, orientationright" # master on right  
        "$mainMod SHIFT, k, layoutmsg, orientationtop" # master on top
        "$mainMod SHIFT, j, layoutmsg, orientationbottom" # master on bottom
        "$mainMod SHIFT, c, layoutmsg, orientationcenter" # master in center
        "$mainMod SHIFT, o, layoutmsg, orientationnext" # cycle orientation

        # Advanced master controls
        "$mainMod CTRL, n, layoutmsg, swapnext" # swap with next window
        "$mainMod CTRL, p, layoutmsg, swapprev" # swap with previous window
        "$mainMod ALT, n, layoutmsg, rollnext" # rotate next window to master
        "$mainMod ALT, p, layoutmsg, rollprev" # rotate previous window to master

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move focus with mainMod + vim keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Navigate between windows with Alt + Tab
        "ALT, Tab, cyclenext,"
        "ALT SHIFT, Tab, cyclenext, prev"

        # Switch workspaces with Alt + hjkl (vim keys)
        "ALT, h, workspace, e-1"
        "ALT, l, workspace, e+1"
        "ALT, k, workspace, e-1"
        "ALT, j, workspace, e+1"

        # Switch workspaces with Alt + arrow keys
        "ALT, left, workspace, e-1"
        "ALT, right, workspace, e+1"
        "ALT, up, workspace, e-1"
        "ALT, down, workspace, e+1"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example: Scroll through existing workspaces (kept for reference)
        # "$mainMod, mouse_down, workspace, e+1"
        # "$mainMod, mouse_up, workspace, e-1"

        # Screenshot bindings
        ", Print, exec, ~/.local/bin/screenshot area"
        "$mainMod, Print, exec, ~/.local/bin/screenshot full"
        "$mainMod SHIFT, S, exec, ~/.local/bin/screenshot copy"
        "CTRL SHIFT, Print, exec, ~/.local/bin/screenshot area"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Auto start applications
      exec-once = [
        "swww-daemon"
        "swww img ~/images/${userWallpaper}"
        "waybar"
        "dunst"
        "walker --gapplication-service"
        "mkdir -p ~/Pictures" # Ensure Pictures directory exists
      ];
    };
  };
}
