{
  programs.nixvim.plugins = {
    fidget = {
      enable = true;
      settings = {
        notification = {
          window = {
            align = "top";
            winblend = 0;
            x_padding = 1;
            y_padding = 1;
          };
        };
      };
    };
  };
}
