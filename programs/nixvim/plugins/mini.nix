{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      modules = {
        move = { };
        ai = { };
      };
    };
  };
}
