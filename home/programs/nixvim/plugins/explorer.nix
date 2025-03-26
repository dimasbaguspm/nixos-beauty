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
    ];
  };
}
