{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    lint = {
      enable = true;

      lazyLoad.settings.event = "DeferredUIEnter";

      lintersByFt = {
        bash = ["shellcheck"];
        json = ["jsonlint"];
        lua = ["luacheck"];
        markdown = ["markdownlint"];
        nix = ["deadnix" "nix" "statix"];
        sh = ["shellcheck"];
        yaml = ["yamllint"];
        javascript = ["eslint_d"];
        typescript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        typescriptreact = ["eslint_d"];
        css = ["stylelint"];
        html = ["htmlhint"];
      };

      linters = {
        deadnix = {cmd = lib.getExe pkgs.deadnix;};
        jsonlint = {cmd = lib.getExe pkgs.nodePackages.jsonlint;};
        luacheck = {cmd = lib.getExe pkgs.luaPackages.luacheck;};
        markdownlint = {cmd = lib.getExe pkgs.markdownlint-cli;};
        shellcheck = {cmd = lib.getExe pkgs.shellcheck;};
        statix = {cmd = lib.getExe pkgs.statix;};
        yamllint = {cmd = lib.getExe pkgs.yamllint;};
        eslint_d = {cmd = lib.getExe pkgs.eslint_d;};
        stylelint = {cmd = lib.getExe pkgs.stylelint;};
        htmlhint = {cmd = lib.getExe pkgs.htmlhint;};
      };
    };
  };
}
