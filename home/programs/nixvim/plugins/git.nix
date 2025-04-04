{
  programs.nixvim = {
    plugins = {
      lazygit = {
        enable = true;
      };
      gitsigns = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";
        settings = {
          current_line_blame = true;
          current_line_blame_opts = {
            delay = 500;
          };
        };
      };
      diffview = {
        enable = true;
      };
    };
    keymaps = [
      {
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        mode = "n";
        options.desc = "Open LazyGit";
      }
      {
        key = "<leader>gd";
        action.__raw = ''
          function()
            if next(require("diffview.lib").views) == nil then
              vim.cmd("DiffviewOpen")
            else
              vim.cmd("DiffviewClose")
            end
          end
        '';
        mode = ["n" "v"];
        options.desc = "Open Diffview";
      }
    ];
  };
}
