{
  programs.nixvim = {
    plugins = {
      lazygit = {
        enable = true;
        settings = {floating_window_winblend = 10;};
      };
      gitsigns = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";
      };
    };
    keymaps = [
      {
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        mode = "n";
        options.desc = "Open LazyGit";
      }
    ];
  };
}
