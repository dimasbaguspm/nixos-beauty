{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        # Only left and right modules
        modules-left = [ "tray" "clock" "custom/user" ];
        modules-right = [ "custom/sysinfo" "network" "custom/logout" ];

        # Tray
        tray = {
          spacing = 10;
          icon-size = 16;
        };

        # Clock (date before time, click to open date settings)
        clock = {
          format = "🕐 {:%A, %d %B %Y %H:%M:%S}";
          tooltip-format = "<big>{:%A, %d %B %Y}</big>";
          on-click = "gnome-control-center datetime || timedatectl";
        };

        # Username
        "custom/user" = {
          format = "⚛ {}";
          tooltip = false;
          exec = "whoami";
          interval = 600;
        };

        # Combined RAM and CPU info
        "custom/sysinfo" = {
          format = "{icon} {text}";
          exec = "cpu=$(top -bn1 | grep 'Cpu(s)' | awk '{print int($2)}'); mem=$(free | awk '/Mem:/ {print int($3/$2 * 100)}'); echo \"{\\\"text\\\": \\\"CPU: $cpu%  RAM: $mem%\\\", \\\"alt\\\": \\\"system\\\", \\\"percentage\\\": $(( cpu > mem ? cpu : mem ))}\"";
          return-type = "json";
          interval = 5;
          format-icons = {
            system = "⚙";
          };
          tooltip = false;
          on-click = "gnome-system-monitor || htop";
        };

        # Network (with wifi icon and on-click to manage network)
        network = {
          format-wifi = "⚡ {essid} ({signalStrength}%) ";
          format-ethernet = "⬢ {ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "⚠ {ifname} (No IP) ";
          format-disconnected = "✗ Disconnected";
          on-click = "nm-connection-editor || nmtui";
        };

        # Logout action (using wlogout)
        "custom/logout" = {
          format = "⏻ Logout";
          tooltip = "Logout";
          on-click = "wlogout";
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
        background: rgba(0, 0, 0, 0.7);
        border-bottom: none;
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      #tray, #clock, #network, #custom-user, #custom-logout, #custom-sysinfo {
        background: transparent;
        color: #ffffff;
        border-radius: 8px;
        padding: 4px 8px;
        margin: 2px;
        font-weight: bold;
        transition: all 0.3s ease;
      }

      #tray:hover, #clock:hover, #network:hover, #custom-user:hover, #custom-sysinfo:hover {
        background: rgba(255, 255, 255, 0.1);
      }

     
      #custom-logout {
        color: #ff6666;
        transition: all 0.3s ease;
      }

      #custom-logout:hover {
        background: rgba(255, 102, 102, 0.2);
      }
    '';
  };
}

