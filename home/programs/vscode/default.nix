{ pkgs
, userMetaData
, ...
}:
let
  inherit (userMetaData) username;
  # define the version of vscode that want to use
  version = "1.102.0";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (_: {
      inherit version;
      src = pkgs.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        sha256 = "sha256-zgrNohvsmhcRQmkX7Io2/U3qbVWdcqwT7VK7Y3ENb9g=";
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
          "workbench.colorTheme" = "Kanagawa Dragon";

          "css.enabledLanguages" = [ "html" ];
          "[nix]" = {
            "editor.defaultFormatter" = "jnoortheen.nix-ide";
            "editor.formatOnSave" = true;
          };
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "${pkgs.nil}/bin/nil";
          "nix.serverSettings" = {
            "nil" = {
              "diagnostics" = {
                "enable" = true;
              };
              "formatting" = {
                "command" = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
              };
            };
          };
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
              version = "1.342.1673";
              sha256 = "sha256-7IiYfOX3Xl3cW5FcG+7FjGAmkw7Wa9802eguRmaFE5Y=";
            }
            {
              name = "copilot-chat";
              publisher = "github";
              version = "0.29.0";
              sha256 = "sha256-Pc04vtCSPlXALPnFtgQcEVa+exzfkYqFh/b8K3bUBJg=";
            }
            {
              name = "material-icon-theme";
              publisher = "PKief";
              version = "5.23.0";
              sha256 = "sha256-numOqtLBqPKhlHXpdKtzg423vijR0p0a8f9niR2WrCc=";
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
              version = "0.27.2";
              sha256 = "sha256-yWQQxYRdU5WWaIiGvCtLYH3mrwDv+frm2ml1S1KPThk=";
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
            {
              name = "nix-ide";
              publisher = "jnoortheen";
              version = "0.4.21";
              sha256 = "sha256-OdZWJNdMmP8sXBc3Krv60CoThJiA809EmTmp8V8uC4o=";
            }
            {
              name = "ng-template";
              publisher = "angular";
              version = "20.0.1";
              sha256 = "sha256-N+2uNX1gXGHAvkx2aff9DfB7vji8bXNLt86yaSYt0o0=";
            }
          ];
      };
    };
  };
}
