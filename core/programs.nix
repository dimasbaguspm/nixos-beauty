{pkgs, ...}: {
  programs = {
    git.enable = true;
    firefox.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        github.copilot-chat
        github.copilot
        github.vscode-pull-request-github
        esbenp.prettier-vscode
        wix.vscode-import-cost
        dbaeumer.vscode-eslint
        yoavbls.pretty-ts-errors
      ];
    })
  ];
}
