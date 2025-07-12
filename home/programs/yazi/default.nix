{ lib, pkgs, ... }:
let
  # Fetch yazi plugins from the official repository
  yaziPluginsSource = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "b8860253fc44e500edeb7a09db648a829084facd";
    sha256 = "sha256-29K8PmBoqAMcQhDIfOVnbJt2FU4BR6k23Es9CqyEloo=";
  };

  # Define plugin sources from the yazi-plugins repository
  # Note: Some plugins require newer Yazi versions, only include compatible ones
  yaziPlugins = {
    full-border = "${yaziPluginsSource}/full-border.yazi";
    # git = "${yaziPluginsSource}/git.yazi";  # Requires Yazi 25.5.31+
    no-status = "${yaziPluginsSource}/no-status.yazi";
    # Add more plugins as needed (check compatibility with Yazi 25.5.28)
    smart-filter = "${yaziPluginsSource}/smart-filter.yazi";
    jump-to-char = "${yaziPluginsSource}/jump-to-char.yazi";
    chmod = "${yaziPluginsSource}/chmod.yazi";
  };
in
{
  programs = {
    yazi = {
      enable = true;
      theme = lib.importTOML ./kanagawa.toml;
      plugins = yaziPlugins;
      initLua = ./init.lua;
      settings = {
        mgr = {
          show_hidden = true;
          sort_by = "mtime";
          sort_reverse = true;
          sort_dir_first = true;
        };
        plugin = {
          # Note: git plugin removed due to version incompatibility
          # prepend_fetcher = [
          #   {
          #     id = "git";
          #     name = "*";
          #     run = "git";
          #   }
          #   {
          #     id = "git";
          #     name = "*/";
          #     run = "git";
          #   }
          # ];
        };
        opener = {
          # Define custom file openers
          edit = [
            { run = "nvim \"$@\""; desc = "Edit with Neovim"; }
            { run = "code \"$@\""; desc = "Edit with VS Code"; }
          ];
          open = [
            { run = "xdg-open \"$@\""; desc = "Open with default application"; }
          ];
          reveal = [
            { run = "xdg-open \"$(dirname \"$0\")\""; desc = "Reveal in file manager"; }
          ];
        };
        # Key bindings for plugins
        keymap = {
          manager = {
            prepend_keymap = [
              { on = "T"; run = "plugin full-border"; desc = "Toggle full border"; }
              # { on = "g"; run = "plugin git"; desc = "Git status"; }  # Removed due to version incompatibility
              { on = "S"; run = "plugin no-status"; desc = "Toggle status bar"; }
              { on = "f"; run = "plugin smart-filter"; desc = "Smart filter"; }
              { on = "J"; run = "plugin jump-to-char"; desc = "Jump to character"; }
              { on = "c"; run = "plugin chmod"; desc = "Change permissions"; }
            ];
          };
        };
      };
    };

    zoxide = { enable = true; };
  };
}
