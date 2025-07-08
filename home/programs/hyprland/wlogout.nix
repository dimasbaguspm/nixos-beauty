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
      window {
        font-family: "CaskaydiaCove Nerd Font", sans-serif;
        font-size: 12px;
        color: #c0caf5;
        background-color: rgba(0, 0, 8, .85);
      }

      button {
        background-repeat: no-repeat;
        background-position: center 15px;
        background-size: 32px 32px;
        border: 1px solid rgba(192, 202, 245, 0.1);
        color: #c0caf5;
        text-shadow: none;
        border-radius: 16px;
        background-color: rgba(19, 19, 29, 0.6);
        margin: 8px;
        min-height: 80px;
        min-width: 80px;
        font-size: 14px;
        font-weight: 500;
        transition: all .3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
        padding-top: 45px;
      }

      button:hover {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(192, 202, 245, 0.3);
        color: #cdd6f4;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
      }

      button:focus {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(192, 202, 245, 0.4);
        color: #cdd6f4;
        outline: none;
      }


      /* Lock button */
      #lock {
        background-image: url("~/images/wlogout-icons/lock.svg");
        background-position: center 15px;
        color: #c0caf5;
      }
      #lock:hover {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(23, 147, 209, 0.5);
        box-shadow: 0 8px 25px rgba(23, 147, 209, 0.2);
      }

      /* Logout button */
      #logout {
        background-image: url("~/images/wlogout-icons/logout.svg");
        background-position: center 15px;
        color: #c0caf5;
      }
      #logout:hover {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(192, 202, 245, 0.5);
      }

      /* Suspend button */
      #suspend {
        background-image: url("~/images/wlogout-icons/suspend.svg");
        background-position: center 15px;
        color: #c0caf5;
      }
      #suspend:hover {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(192, 202, 245, 0.5);
      }

      /* Hibernate button */
      #hibernate {
        background-image: url("~/images/wlogout-icons/hibernate.svg");
        background-position: center 15px;
        color: #c0caf5;
      }
      #hibernate:hover {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(192, 202, 245, 0.5);
      }

      /* Reboot button */
      #reboot {
        background-image: url("~/images/wlogout-icons/reboot.svg");
        background-position: center 15px;
        color: #c0caf5;
      }
      #reboot:hover {
        background-color: rgba(26, 27, 38, 0.9);
        border-color: rgba(192, 202, 245, 0.5);
      }

      /* Shutdown button with warning color */
      #shutdown {
        background-image: url("~/images/wlogout-icons/shutdown.svg");
        background-position: center 15px;
        color: #f7768e;
        border-color: rgba(247, 118, 142, 0.2);
      }
      #shutdown:hover {
        background-color: rgba(247, 118, 142, 0.15);
        border-color: rgba(247, 118, 142, 0.6);
        color: #f7768e;
        box-shadow: 0 8px 25px rgba(247, 118, 142, 0.3);
      }
    '';
  };
}
