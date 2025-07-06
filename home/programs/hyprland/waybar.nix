{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;


        modules-left = [ "hyprland/workspaces" "hyprland/mode" "hyprland/scratchpad" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "battery" "clock" "tray" ];

        # Workspaces
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        # Window title
        "hyprland/window" = {
          format = "{}";
          max-length = 50;
        };

        # System tray
        tray = {
          spacing = 10;
        };

        # Clock
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        # CPU
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        # Memory
        memory = {
          format = "{}% ";
        };

        # Temperature
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [ "" "" "" ];
        };

        # Backlight
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        # Battery
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        # Network
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        # Audio
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        # Idle inhibitor
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
      };
    };

    style = ''
      * {
        font-family: "CaskaydiaCove Nerd Font", sans-serif;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: linear-gradient(180deg, rgba(30, 144, 255, 0.85) 0%, rgba(0, 100, 200, 0.9) 100%);
        border-bottom: 2px solid rgba(135, 206, 235, 0.8);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 4px;
        margin: 2px;
      }

      button:hover {
        background: rgba(255, 255, 255, 0.2);
        box-shadow: inset 0 -3px #87CEEB;
      }

      #workspaces button {
        padding: 0 8px;
        background: rgba(255, 255, 255, 0.1);
        color: #ffffff;
        border-radius: 6px;
        margin: 2px;
      }

      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.25);
      }

      #workspaces button.active {
        background: rgba(135, 206, 235, 0.8);
        color: #1e1e2e;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
      }

      #workspaces button.urgent {
        background: rgba(255, 100, 100, 0.8);
        animation: blink 0.5s linear infinite alternate;
      }

      #clock {
        background: rgba(30, 144, 255, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 12px;
        margin: 2px;
        font-weight: bold;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      }

      #battery {
        background: rgba(60, 179, 113, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #battery.charging, #battery.plugged {
        background: rgba(50, 205, 50, 0.9);
      }

      #battery.critical:not(.charging) {
        background: rgba(220, 20, 60, 0.9);
        animation: blink 0.5s linear infinite alternate;
      }

      #cpu {
        background: rgba(70, 130, 180, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #memory {
        background: rgba(106, 90, 205, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #network {
        background: rgba(32, 178, 170, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #network.disconnected {
        background: rgba(220, 20, 60, 0.8);
      }

      #pulseaudio {
        background: rgba(255, 140, 0, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #pulseaudio.muted {
        background: rgba(128, 128, 128, 0.8);
      }

      #temperature {
        background: rgba(255, 69, 0, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #backlight {
        background: rgba(255, 215, 0, 0.8);
        color: #1e1e2e;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #tray {
        background: rgba(100, 149, 237, 0.8);
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #idle_inhibitor {
        background: rgba(75, 0, 130, 0.8);
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
      }

      #idle_inhibitor.activated {
        background: rgba(255, 255, 255, 0.9);
        color: #1e1e2e;
      }

      @keyframes blink {
        to {
          background-color: rgba(255, 255, 255, 0.8);
          color: #1e1e2e;
        }
      }
    '';
  };
}
