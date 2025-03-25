{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {fzf-native = {enable = true;};};
        lazyLoad.settings.cmd = "Telescope";
      };
    };
    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        mode = "n";
        options.desc = "Find Files";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Find Live Grep";
      }
    ];
  };
}
