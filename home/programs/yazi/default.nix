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
      settings = {
        manager = { show_hidden = true; };
        plugin = {
          prepend_fetcher = [
            {
              id = "git";
              name = "*";
              run = "git";
            }
            {
              id = "git";
              name = "*/";
              run = "git";
            }

          ];

        };
      };
    };

    zoxide = { enable = true; };

  };
}
