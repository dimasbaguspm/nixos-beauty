{pkgs, ...}: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent = {enable = true;};
        highlight = {enable = true;};
      };

      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    treesitter-context = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
