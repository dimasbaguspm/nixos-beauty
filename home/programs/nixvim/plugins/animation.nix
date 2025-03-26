{
  programs.nixvim.plugins = {
    neoscroll = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    smear-cursor = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
