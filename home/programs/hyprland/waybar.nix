{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;

        # Following SimpleBlueColorWaybar layout
        modules-left = [ "custom/nixos" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "idle_inhibitor" "pulseaudio" "cpu" "memory" "temperature" "hyprland/language" "network" "custom/logout" ];

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
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          on-click = "pavucontrol";
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
      };
    };

    style = ''
      * {
        font-family:"CaskaydiaCove Nerd Font", sans-serif;
        font-size: 12px;
        transition: background-color .3s ease-out;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        transition-property: background-color;
        transition-duration: .5s;
      }


      .modules-left,
      .modules-center,
      .modules-right {
        background: rgba(0, 0, 8, .7);
        margin: 5px 10px;
        padding: 4px;
        border-radius: 12px;
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
      #idle_inhibitor,
      #language,
      #tray,
      #custom-logout {
        padding: 8px;
        border-radius: 12px;
        margin: 0 2px;
      }

      #clock:hover,
      #cpu:hover,
      #memory:hover,
      #temperature:hover,
      #network:hover,
      #pulseaudio:hover,
      #idle_inhibitor:hover,
      #language:hover,
      #tray:hover,
      #custom-logout:hover {
        background: rgba(26, 27, 38, 0.9);
      }

      #workspaces button {
        background: transparent;
        font-weight: 900;
        color: #c0caf5;
        border: none;
        border-radius: 12px;
        margin: 0 2px;
      }

      #workspaces button.active {
        background: #13131d;
      }

      #workspaces button:hover {
        background: #11111b;
        color: #cdd6f4;
        box-shadow: none;
      }

      #custom-nixos {
        margin: 0px 5px;
        padding: 4px;
        font-size: 16px;
        transition: color .5s;
        color: #c0caf5;
      }
      
      #custom-nixos:hover {
        color: #1793d1;
      }

      #cpu {
        color: #c0caf5;
      }

      #memory {
        color: #c0caf5;
      }

      #temperature {
        color: #c0caf5;
      }

      #network {
        color: #c0caf5;
      }

      #pulseaudio {
        color: #c0caf5;
      }

      #idle_inhibitor {
        color: #c0caf5;
      }

      #language {
        color: #c0caf5;
      }

      #custom-logout {
        color: #f7768e;
        font-weight: bold;
        padding: 8px;
        border-radius: 9999px;
      }

      #custom-logout:hover {
        background: rgba(247, 118, 142, 0.2);
      }

      #clock {
        font-weight: bold;
        color: #c0caf5;
      }
    '';
  };
}

