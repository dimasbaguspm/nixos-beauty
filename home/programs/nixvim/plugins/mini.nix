{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      modules = {
        move = {};
        ai = {};
      };
    };
  };
}
