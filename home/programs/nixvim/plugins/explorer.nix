{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;
      lazyLoad.settings.cmd = ["Yazi"];
    };

    keymaps = [
      {
        key = "<leader>ee";
        mode = "n";
        action = "<cmd>Yazi<cr>";
        options.desc = "Open Explorer";
      }
      {
        key = "<leader>eE";
        mode = "n";
        action = "<cmd>Yazi cwd<cr>";
        options.desc = "Open Explorer in working directory";
      }
    ];
  };
}
