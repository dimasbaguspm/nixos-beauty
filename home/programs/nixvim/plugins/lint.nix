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
        html = ["htmlhint"];
        javascript = ["eslint_d"];
        typescript = ["eslint_d"];
      };

      linters = {
        deadnix = {cmd = lib.getExe pkgs.deadnix;};
        jsonlint = {cmd = lib.getExe pkgs.nodePackages.jsonlint;};
        luacheck = {cmd = lib.getExe pkgs.luaPackages.luacheck;};
        markdownlint = {cmd = lib.getExe pkgs.markdownlint-cli;};
        shellcheck = {cmd = lib.getExe pkgs.shellcheck;};
        statix = {cmd = lib.getExe pkgs.statix;};
        yamllint = {cmd = lib.getExe pkgs.yamllint;};
        htmlhint = {cmd = lib.getExe pkgs.htmlhint;};
        eslint_d = {cmd = lib.getExe pkgs.eslint_d;};
      };
    };
  };
}
