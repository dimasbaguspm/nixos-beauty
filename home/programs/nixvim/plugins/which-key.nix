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
            __unkeyed = "<leader>e";
            group = "Explorer";
            icon = " ";
          }
          {
            __unkeyed = "<leader>g";
            group = "Git";
            icon = ":shit:";
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
        ];
        win = {
          wo = {
            winblend = 85;
          };
        };
      };
    };
  };
}
