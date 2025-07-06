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
    ./rofi.nix
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
        "col.active_border" = "rgba(87CEEBee) rgba(4682B4ee) 45deg"; # Sky blue gradient
        "col.inactive_border" = "rgba(2C3E50aa)"; # Dark blue-gray

        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration settings
      decoration = {
        rounding = 8;

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
          "borderangle, 1, 8, default"
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
        new_status = "master";
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
        "float, class:^(kitty)$"
        "float, class:^(thunar)$"
        "float, class:^(pavucontrol)$"
        "float, class:^(rofi)$"
        "size 800 600, class:^(thunar)$"
        "center, class:^(thunar)$"
        "float, class:^(wlogout)$"
        "center, class:^(wlogout)$"
        "size 400 300, class:^(wlogout)$"
      ];

      # Key bindings
      "$mainMod" = "SUPER";

      bind = [
        # Application launches
        "$mainMod, Q, exec, kitty"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"

        # Quick actions
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, T, togglegroup,"
        "$mainMod, Tab, changegroupactive,"
        "$mainMod SHIFT, R, exec, hyprctl reload"
        "$mainMod SHIFT, E, exec, wlogout"
        "$mainMod, L, exec, hyprlock"

        # Audio controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Brightness controls
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

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

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

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
        "mkdir -p ~/Pictures" # Ensure Pictures directory exists
      ];
    };
  };
}
