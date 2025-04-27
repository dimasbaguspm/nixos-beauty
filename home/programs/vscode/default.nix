{
  pkgs,
  userMetaData,
  ...
}: let
  inherit (userMetaData) username;
in {
  programs.vscode = {
    enable = true;
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
        };
        extensions = with pkgs.vscode-extensions;
          [
            yzhang.markdown-all-in-one
            github.copilot-chat
            github.copilot
            dbaeumer.vscode-eslint
            github.vscode-pull-request-github
            wix.vscode-import-cost
            yoavbls.pretty-ts-errors
            streetsidesoftware.code-spell-checker
          ]
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "material-icon-theme";
              publisher = "PKief";
              version = "4.28.0";
              sha256 = "sha256-DO3dcJPk+TMhfb0IJ/eTB7nIKfyCXIiyhZFBpZjJzsM=";
            }
          ];
      };
    };
  };
}
