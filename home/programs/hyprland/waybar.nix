{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;

        # Following SimpleBlueColorWaybar layout
        modules-left = [ "custom/nixos" "custom/minimized" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "idle_inhibitor" "pulseaudio" "bluetooth" "cpu" "memory" "temperature" "hyprland/language" "network" "custom/logout" ];

        # logo 
        "custom/nixos" = {
          format = "";
          tooltip = "Nixos Beauty";
        };

        # Hyprland workspaces
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          format-icons = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        # Tray
        tray = {
          spacing = 10;
          icon-size = 16;
        };

        # Idle inhibitor
        idle_inhibitor = {
          format = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };

        # PulseAudio
        pulseaudio = {
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{icon} {volume}%  {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        bluetooth = {
          "format" = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          "on-click" = "blueman-manager";
          "on-click-right" = "bluetuith";
        };

        # Clock (centered)
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %d %B %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        # CPU usage
        cpu = {
          format = "  {usage}%";
          tooltip = true;
        };

        # Memory usage
        memory = {
          format = " {}%";
          tooltip = true;
        };

        # Temperature
        temperature = {
          interval = 10;
          hwmon-path = "/sys/class/thermal/thermal_zone0/temp";
          critical-threshold = 100;
          format-critical = "  {temperatureC}";
          format = "  {temperatureC}°C";
        };

        # Hyprland language
        "hyprland/language" = {
          format = "   {}";
          format-en = "EN";
        };

        # Network (with better styling)
        network = {
          "format-wifi" = "   {essid} ({signalStrength}%)";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
        };

        # Logout action
        "custom/logout" = {
          format = "⏻";
          tooltip = "Power Menu";
          on-click = "wlogout";
        };

        # Minimized windows indicator
        "custom/minimized" = {
          format = "󱂬 ";
          return-type = "json";
          interval = 2;
          exec = "bash -c 'count=$(hyprctl clients -j | jq -r \"[.[] | select(.workspace.name == \\\"special:minimized\\\")] | length\"); if [ \"$count\" -eq 0 ]; then echo \"{\\\"text\\\": \\\"\\\", \\\"tooltip\\\": \\\"No minimized windows\\\", \\\"class\\\": \\\"empty\\\"}\"; else echo \"{\\\"text\\\": \\\"  $count\\\", \\\"tooltip\\\": \\\"$count minimized windows\\nClick to toggle view\\nShift+Click to restore all\\\", \\\"class\\\": \\\"minimized\\\"}\"; fi'";
          on-click = "hyprctl dispatch togglespecialworkspace minimized";
          on-click-right = "hyprctl dispatch movetoworkspacesilent e+0 && hyprctl dispatch togglespecialworkspace minimized";
          tooltip = true;
        };
      };
    };

    style = ''
      /* Kanagawa color scheme for Waybar */
      * {
        font-family:"CaskaydiaCove Nerd Font", sans-serif;
        font-size: 12px;
        transition: background-color .2s ease-out;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        transition-property: background-color;
        transition-duration: .3s;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        background: rgba(31, 31, 40, 0.9);        /* #1f1f28 - theme_bg_color */
        margin: 5px 10px;
        padding: 4px;
        border-radius: 8px;
        border: 1px solid rgba(220, 215, 186, 0.12);  /* borders */
      }

      .modules-center {
        padding: 0px;
      }

      #clock,
      #cpu,
      #memory,
      #temperature,
      #network,
      #pulseaudio,
      #bluetooth,
      #idle_inhibitor,
      #language,
      #tray,
      #custom-logout,
      #custom-minimized {
        padding: 8px;
        border-radius: 6px;
        margin: 0 2px;
        color: #dcd7ba;                           /* theme_fg_color */
      }

      #clock:hover,
      #cpu:hover,
      #memory:hover,
      #temperature:hover,
      #network:hover,
      #pulseaudio:hover,
      #bluetooth:hover,
      #idle_inhibitor:hover,
      #language:hover,
      #tray:hover,
      #custom-logout:hover,
      #custom-minimized:hover {
        background: rgba(200, 192, 147, 0.1);    /* accent_color with low opacity */
        border-radius: 6px;
      }

      #workspaces button {
        background: transparent;
        font-weight: 900;
        color: #dcd7ba;                           /* theme_fg_color */
        border: none;
        border-radius: 6px;
        margin: 0 2px;
        padding: 4px 8px;
      }

      #workspaces button.active {
        background: #c8c093;                     /* theme_selected_bg_color */
        color: rgba(0, 0, 0, 0.87);             /* theme_selected_fg_color */
      }

      #workspaces button:hover {
        background: rgba(200, 192, 147, 0.2);    /* accent_color with transparency */
        color: #dcd7ba;                          /* theme_fg_color */
        box-shadow: none;
      }

      #custom-nixos {
        margin: 0px 5px;
        padding: 4px;
        font-size: 16px;
        transition: color .3s;
        color: #FDD633;                          /* warning_color - yellow accent */
      }
      
      #custom-nixos:hover {
        color: #c8c093;                          /* accent_color */
      }

      #cpu {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #memory {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #temperature {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #network {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #pulseaudio {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #idle_inhibitor {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #language {
        color: #dcd7ba;                          /* theme_fg_color */
      }

      #custom-logout {
        color: #F28B82;                          /* error_color - red for power */
        font-weight: bold;
        padding: 8px;
        border-radius: 50%;
      }

      #custom-logout:hover {
        background: rgba(242, 139, 130, 0.2);    /* error_color with transparency */
      }

      #clock {
        font-weight: bold;
        color: #c8c093;                          /* accent_color */
      }

      /* Temperature warning states */
      #temperature.critical {
        color: #F28B82;                          /* error_color */
      }

      /* Network states */
      #network.disconnected {
        color: #F28B82;                          /* error_color */
      }

      /* Audio states */
      #pulseaudio.muted {
        color: rgba(220, 215, 186, 0.5);        /* theme_fg_color dimmed */
      }

      /* Idle inhibitor states */
      #idle_inhibitor.activated {
        color: #81C995;                          /* success_color */
      }

      #idle_inhibitor.deactivated {
        color: rgba(220, 215, 186, 0.5);        /* theme_fg_color dimmed */
      }

      /* Bluetooth states */
      #bluetooth {
        color: #dcd7ba;                          /* theme_fg_color - default */
      }

      #bluetooth.on {
        color: #7e9cd8;                          /* crystalBlue - enabled but not connected */
      }

      #bluetooth.connected {
        color: #81C995;                          /* success_color - connected */
      }

      #bluetooth.off {
        color: rgba(220, 215, 186, 0.3);        /* theme_fg_color heavily dimmed */
      }

      #bluetooth.disabled {
        color: rgba(220, 215, 186, 0.3);        /* theme_fg_color heavily dimmed */
      }

      #bluetooth.discoverable {
        color: #e6c384;                          /* carpYellow - discoverable mode */
      }

      /* Minimized windows indicator */
      #custom-minimized {
        color: #7e9cd8;                          /* crystalBlue - minimized indicator */
        font-weight: bold;
      }

      #custom-minimized:hover {
        background: rgba(126, 156, 216, 0.2);    /* crystalBlue with transparency */
      }

      #custom-minimized.empty {
        color: rgba(220, 215, 186, 0.3);        /* theme_fg_color heavily dimmed when no minimized windows */
      }
    '';
  };
}

