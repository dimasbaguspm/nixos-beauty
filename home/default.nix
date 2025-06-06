{
  inputs,
  pkgs,
  ...
}: let
  inherit (import ../.config.nix) username;
  userMetaData = {
    inherit username;
    env = import ./users/${username}.metadata.nix;
  };
in {
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
        ];
        shell = {enableZshIntegration = true;};
        stateVersion = "25.05";

        file = {
          "images" = {
            source = ./assets;
            recursive = true;
          };
        };
      };

      imports = [./programs];

      fonts = {fontconfig = {enable = true;};};

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
