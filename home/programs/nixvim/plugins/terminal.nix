{
  programs.nixvim = {
    plugins = {
      toggleterm = {
        enable = true;
        lazyLoad.settings.cmd = "ToggleTerm";
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>tf";
        action = "<cmd>ToggleTerm size=40 dir=git_dir<cr>";
        options.desc = "Toggle Terminal";
      }
    ];
  };
}
