{
  programs.nixvim = {
    plugins = {
      lazygit = { enable = true; };
      gitsigns = { enable = true; };
    };
    keymaps = [{
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      mode = "n";
      options.desc = "Open LazyGit";
    }];
  };
}
