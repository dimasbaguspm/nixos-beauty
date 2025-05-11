{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [shfmt alejandra stylua prettierd];

    plugins.conform-nvim = {
      enable = true;

      lazyLoad.settings = {
        cmd = ["ConformInfo"];
      };

      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;

        formatters_by_ft = {
          lua = ["stylua"];
          nix = ["alejandra"];
          bash = ["shfmt"];
          # NOTE: clash with lsp lang
          # javascript = ["prettierd"];
          # javascriptreact = ["prettierd"];
          # typescript = ["prettierd"];
          # typescriptreact = ["prettierd"];
          css = ["prettierd"];
          html = ["prettierd"];
          json = ["prettierd"];
          yaml = ["prettierd"];
          markdown = ["prettierd"];
        };
      };
    };
  };
}
