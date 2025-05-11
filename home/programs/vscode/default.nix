{
  pkgs,
  userMetaData,
  ...
}: let
  inherit (userMetaData) username;
  # define the version of vscode that want to use
  version = "1.100.0";
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (_: {
      inherit version;
      src = pkgs.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        sha256 = "sha256-egvyjMpmSyUUo4PdHpORNAA5pabVVKSZdn7zqRa1/kM=";
      };
    });
    profiles = {
      "${username}" = {
        userSettings = {
          "files.autoSave" = "off";
          "editor.fontFamily" = "'CaskaydiaCove Nerd Font', 'monospace', monospace";
          "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
          "editor.formatOnSave" = true;
          "editor.formatOnPaste" = true;
          "editor.formatOnType" = false;
          "editor.formatOnSaveMode" = "file";
          "editor.minimap.enabled" = false;
          "eslint.format.enable" = true;
          "editor.codeActionsOnSave" = {
            "source.fixAll.eslint" = "always";
          };
          "git.autofetch" = true;
          "git.confirmSync" = false;
          "git.autorefresh" = true;
          "git.fetchOnPull" = true;
          "git.pruneOnFetch" = true;
          "workbench.iconTheme" = "material-icon-theme";
          "workbench.colorTheme" ="Kanagawa Dragon";

          "css.enabledLanguages" = ["html"];
        };
        extensions = with pkgs.vscode-extensions;
          [
            yzhang.markdown-all-in-one
            dbaeumer.vscode-eslint
            github.vscode-pull-request-github
            wix.vscode-import-cost
            yoavbls.pretty-ts-errors
            streetsidesoftware.code-spell-checker
          ]
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "copilot";
              publisher = "github";
              version = "1.284.0";
              sha256 = "sha256-SoagiauSRbBjYouW1QDC9ZNgMl9lDH+UwtuITKsZAz8=";
            }
            {
              name = "copilot-chat";
              publisher = "github";
              version = "0.27.0";
              sha256 = "sha256-i7KKW+aM8P1nrgnLZssgAlKm1kaQyeh285EnoN9Bwps=";
            }
            {
              name = "material-icon-theme";
              publisher = "PKief";
              version = "4.28.0";
              sha256 = "sha256-DO3dcJPk+TMhfb0IJ/eTB7nIKfyCXIiyhZFBpZjJzsM=";
            }
            {
              name = "kanagawa-vscode-color-theme";
              publisher = "metaphore";
              version = "0.5.0";
              sha256 = "sha256-Os4v1zXnr+WLXyvjS8qgf3UOJHGd4lmCczjVaCArXtA=";
            }
            {
              name = "vscode-github-actions";
              publisher = "github";
              version = "0.27.1";
              sha256 = "sha256-mHKaWXSyDmsdQVzMqJI6ctNUwE/6bs1ZyeAEWKg9CV8=";
            }
            {
              name = "jsoncrack-vscode";
              publisher = "aykutsarac";
              version = "3.0.0";
              sha256 = "sha256-SwgUm6rIEp15Lc86UHTD5gVHrs9Mwbcwsb7LL5SGVy4=";
            }
            {
              name = "vscode-html-css";
              publisher = "ecmel";
              version = "2.0.13";
              sha256 = "sha256-2BtvIyeUaABsWjQNCSAk0WaGD75ecRA6yWbM/OiMyM0=";
            }
          ];
      };
    };
  };
}
