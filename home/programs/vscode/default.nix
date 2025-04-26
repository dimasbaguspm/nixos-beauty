{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles = {
      kyrielle = {
        userSettings = {
          files.autoSave = "off";
          editor = {
            fontFamily = "'CaskaydiaCove Nerd Font', 'monospace', monospace";
            minimap.enabled = false;
          };
        };
      };
    };
    extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      github.copilot-chat
      github.copilot
      github.vscode-pull-request-github
      esbenp.prettier-vscode
      wix.vscode-import-cost
      dbaeumer.vscode-eslint
      yoavbls.pretty-ts-errors
    ];
  };
}
