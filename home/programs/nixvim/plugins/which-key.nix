{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
        spec = [
          {
            __unkeyed = "<leader>f";
            group = "Find";
            icon = " ";
          }
          {
            __unkeyed = "<leader>s";
            group = "Search";
            icon = " ";
          }
          {
            __unkeyed = "<leader>e";
            group = "Explorer";
            icon = " ";
          }
          {
            __unkeyed = "<leader>g";
            group = "Git";
            icon = " ";
          }
          {
            __unkeyed = "<leader>t";
            group = "Terminal";
            icon = " ";
          }
          {
            __unkeyed = "<leader>n";
            group = "Notifications";
            icon = " ";
          }
          {
            __unkeyed = "<leader>c";
            group = "Code";
            icon = " ";
          }
        ];
        win = {
          wo = {
            winblend = 10;
          };
        };
      };
    };
  };
}
