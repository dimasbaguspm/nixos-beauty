{
  programs.nixvim.plugins.yazi = {
    enable = true;
    autoLoad = true;
  };
  programs.nixvim.keymaps = [{
    key = "<leader>ee";
    mode = "n";
    action = "<cmd>Yazi<cr>";
    options.desc = "Open Explorer";
  }];
}
