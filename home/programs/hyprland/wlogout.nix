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
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(30, 32, 48, 0.9);
      }

      button {
        color: #E6F3FF;
        background-color: rgba(70, 130, 180, 0.8);
        border-style: solid;
        border-width: 2px;
        border-radius: 20px;
        border-color: #87CEEB;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3);
        margin: 5px;
        transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
        background-color: rgba(135, 206, 235, 0.9);
        box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.4);
      }

      button:focus {
        background-color: rgba(135, 206, 235, 1.0);
        box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.5);
      }

      #lock {
        background-image: image(url("/usr/share/wlogout/icons/lock.png"));
      }

      #logout {
        background-image: image(url("/usr/share/wlogout/icons/logout.png"));
      }

      #suspend {
        background-image: image(url("/usr/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
        background-image: image(url("/usr/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
        background-image: image(url("/usr/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
        background-image: image(url("/usr/share/wlogout/icons/reboot.png"));
      }
    '';
  };
}
