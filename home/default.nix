{ inputs
, pkgs
, ...
}:
let
  inherit (import ../.config.nix) username;
  userMetaData = {
    inherit username;
    env = import ./users/${username}.metadata.nix;
  };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.sops-nix.homeManagerModules.sops
    ];
    extraSpecialArgs = {
      inherit userMetaData;
    };
    backupFileExtension = "backup";

    users.${username} = {
      sops = {
        age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
        defaultSopsFile = ./users/${username}.secret.yaml;

        secrets = {
          CODE_STATS_API.path = "~/.config/sops-nix/secrets/CODE_STATS_API";
          WAKATIME_API_KEY.path = "~/.config/sops-nix/secrets/WAKATIME_API_KEY";
          NPM_TOKEN_KEY.path = "~/.config/sops-nix/secrets/NPM_TOKEN_KEY";
        };
      };

      home = {
        inherit username;
        homeDirectory = "/home/${username}";
        packages = with pkgs; [
          neofetch
          starship
          nerd-fonts.caskaydia-cove
          ripgrep
          fzf
          tree
          jq
          fd
          bat
          sops
          age

          # Wayland/Hyprland tools
          wl-clipboard
          grim
          slurp
          swww
          dunst
          pavucontrol
        ];
        shell = { enableZshIntegration = true; };
        stateVersion = "25.05";

        file = {
          "images" = {
            source = ./assets;
            recursive = true;
          };

          ".local/bin/screenshot" = {
            text = ''
              #!/usr/bin/env bash
              
              # Create Pictures directory if it doesn't exist
              mkdir -p ~/Pictures
              
              # Get current date and time for filename
              timestamp=$(date +%Y%m%d-%H%M%S)
              
              case "$1" in
                "area")
                  grim -g "$(slurp)" ~/Pictures/screenshot-$timestamp.png
                  notify-send "Screenshot" "Area screenshot saved to ~/Pictures/screenshot-$timestamp.png"
                  ;;
                "full")
                  grim ~/Pictures/fullscreen-$timestamp.png
                  notify-send "Screenshot" "Full screenshot saved to ~/Pictures/fullscreen-$timestamp.png"
                  ;;
                "copy")
                  grim -g "$(slurp)" - | wl-copy
                  notify-send "Screenshot" "Screenshot copied to clipboard"
                  ;;
                *)
                  echo "Usage: screenshot {area|full|copy}"
                  exit 1
                  ;;
              esac
            '';
            executable = true;
          };
        };
      };

      imports = [ ./programs ];

      fonts = { fontconfig = { enable = true; }; };

      programs.home-manager.enable = true;

      editorconfig = {
        enable = true;
        settings = {
          "*" = {
            charset = "utf-8";
            end_of_line = "lf";
            trim_trailing_whitespace = true;
            insert_final_newline = true;
            indent_style = "space";
            indent_size = 2;
          };
        };
      };
    };
  };
}
