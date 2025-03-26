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
      servers = {
        nixd = {enable = true;};
        lua_ls = {enable = true;};
        vtsls = {enable = true;};
        eslint = {enable = true;};
      };
    };
  };
}
