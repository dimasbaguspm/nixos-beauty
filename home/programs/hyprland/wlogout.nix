{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprctl dispatch exec 'swaylock -f'";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
    ];
    style = ''
      * {
        background-image: none;
        box-shadow: none;
        font-family: "CaskaydiaCove Nerd Font", sans-serif;
      }

      window {
        background-color: rgba(30, 32, 48, 0.95);
        backdrop-filter: blur(10px);
      }

      button {
        color: #E6F3FF;
        background: linear-gradient(135deg, rgba(70, 130, 180, 0.9), rgba(135, 206, 235, 0.8));
        border-style: solid;
        border-width: 2px;
        border-radius: 12px;
        border-color: rgba(135, 206, 235, 0.6);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 28%;
        box-shadow: 
          0 4px 15px rgba(0, 0, 0, 0.4),
          inset 0 1px 0 rgba(255, 255, 255, 0.1);
        margin: 8px;
        min-height: 80px;
        min-width: 80px;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        font-weight: 500;
        font-size: 12px;
      }

      button:hover {
        background: linear-gradient(135deg, rgba(135, 206, 235, 0.95), rgba(70, 130, 180, 0.9));
        border-color: rgba(135, 206, 235, 0.9);
        box-shadow: 
          0 8px 25px rgba(135, 206, 235, 0.3),
          0 4px 15px rgba(0, 0, 0, 0.4),
          inset 0 1px 0 rgba(255, 255, 255, 0.2);
        transform: translateY(-2px) scale(1.05);
      }

      button:focus {
        background: linear-gradient(135deg, rgba(135, 206, 235, 1.0), rgba(70, 130, 180, 0.95));
        border-color: #87CEEB;
        box-shadow: 
          0 0 0 3px rgba(135, 206, 235, 0.4),
          0 8px 25px rgba(135, 206, 235, 0.4),
          0 4px 15px rgba(0, 0, 0, 0.4),
          inset 0 1px 0 rgba(255, 255, 255, 0.3);
        transform: translateY(-2px) scale(1.05);
      }

      /* Modern icon styling using Unicode symbols */
      #lock {
        background-image: none;
      }
      #lock:before {
        content: "🔒";
        font-size: 24px;
        display: block;
        text-align: center;
        margin-bottom: 4px;
      }

      #logout {
        background-image: none;
      }
      #logout:before {
        content: "🚪";
        font-size: 24px;
        display: block;
        text-align: center;
        margin-bottom: 4px;
      }

      #suspend {
        background-image: none;
      }
      #suspend:before {
        content: "💤";
        font-size: 24px;
        display: block;
        text-align: center;
        margin-bottom: 4px;
      }

      #hibernate {
        background-image: none;
      }
      #hibernate:before {
        content: "🐻";
        font-size: 24px;
        display: block;
        text-align: center;
        margin-bottom: 4px;
      }

      #shutdown {
        background-image: none;
      }
      #shutdown:before {
        content: "⏻";
        font-size: 24px;
        display: block;
        text-align: center;
        margin-bottom: 4px;
      }

      #reboot {
        background-image: none;
      }
      #reboot:before {
        content: "🔄";
        font-size: 24px;
        display: block;
        text-align: center;
        margin-bottom: 4px;
      }
    '';
  };
}
