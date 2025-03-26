{
  programs.nixvim.plugins = {
    dropbar = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        sources = {
          path.max_depth = 5;
        };
      };
    };
  };
}
