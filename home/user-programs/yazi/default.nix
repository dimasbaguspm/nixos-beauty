{ lib, ... }: {
  programs = {
    yazi = {
      enable = true;
      theme = lib.importTOML ./kanagawa.toml;
      plugins = {
        full-border = ./plugins/full-border;
        git = ./plugins/git;
        no-status = ./plugins/no-status;
      };
      initLua = ./init.lua;
    };

    zoxide = { enable = true; };

  };
}
