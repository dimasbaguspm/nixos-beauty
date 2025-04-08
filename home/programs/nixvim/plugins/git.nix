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
        fileHistoryPanel = {
          winConfig = {
            position = "left";
          };
        };
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
        key = "<leader>gco";
        action.__raw = ''
          function()
            if next(require("diffview.lib").views) == nil then
              vim.cmd("DiffviewOpen origin")
            else
              vim.cmd("DiffviewClose")
            end
          end
        '';
        mode = ["n" "v"];
        options.desc = "Changed Files from Origin";
      }
      {
        key = "<leader>gch";
        action.__raw = ''
          function()
              if next(require("diffview.lib").views) == nil then
                vim.cmd("DiffviewOpen HEAD")
              else
                vim.cmd("DiffviewClose")
              end
            end
        '';
        mode = ["n" "v"];
        options.desc = "Changed Files from Head";
      }
      {
        "key" = "<leader>gh";
        action.__raw = ''
          function()
              if next(require("diffview.lib").views) == nil then
                vim.cmd("DiffviewFileHistory")
              else
                vim.cmd("DiffviewClose")
              end
            end
        '';
        mode = ["n" "v"];
        options.desc = "Branch History";
      }
    ];
  };
}
