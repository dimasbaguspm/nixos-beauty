{
  programs.nixvim.plugins = {
    lsp-lines = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    lsp-format = {
      enable = true;
    };
    lsp-signature = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      luaConfig = {
        post = ''
          require('lspconfig').eslint.setup({
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
           end,
          })
        '';
      };
      servers = {
        nixd = {enable = true;};
        lua_ls = {enable = true;};
        vtsls = {enable = true;};
        eslint = {enable = true;};
        jsonls = {enable = true;};
        html = {enable = true;};
        yamlls = {enable = true;};
        cssls = {enable = true;};
      };
    };
  };
}
