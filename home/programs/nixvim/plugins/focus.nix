{
  programs.nixvim = {
    plugins = {
      twilight = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";
        settings = {
          dimming = {
            alpha = 0.6;
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>cf";
        action = "<cmd>Twilight<cr>";
        options.desc = "Toggle Focus";
      }
    ];
  };
}
