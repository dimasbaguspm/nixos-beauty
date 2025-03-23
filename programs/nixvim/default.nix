{ pkgs, ... }: {
  imports = [
    ./plugins/lazy-load.nix
    ./plugins/auto-pairs.nix
    ./plugins/code-comment.nix
    ./plugins/explorer.nix
    ./plugins/lsp.nix
    ./plugins/terminal.nix
    ./plugins/tree-sitter.nix
    ./plugins/formatter.nix
    ./plugins/lint.nix
    ./plugins/completion.nix
    ./plugins/git.nix
    ./plugins/session.nix
    ./plugins/telescope.nix
    ./plugins/noice.nix
    ./plugins/footer.nix
    ./plugins/header.nix
    ./plugins/dashboard.nix
    ./plugins/fidget.nix
    ./plugins/mini.nix
    ./plugins/which-key.nix
    ./plugins/icon.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes = { kanagawa.enable = true; };
    clipboard = {
      register = "unnamedplus";
      providers = { wl-copy.enable = true; };
    };
    opts = {
      number = true;
      relativenumber = true;
    };
    extraPlugins = [
      pkgs.vimPlugins.supermaven-nvim
      (pkgs.vimUtils.buildVimPlugin {
        name = "codestats";
        src = pkgs.fetchFromGitHub {
          owner = "liljaylj";
          repo = "codestats.nvim";
          rev = "041b315c4f82997186fcdb3fc2f687cc128a28f3";
          hash = "sha256-00yy4Ftk5LLxoWJwjggJcJvkQLkvGhOuXxgyBGi9Pig=";
        };
        dependencies = [ pkgs.vimPlugins.plenary-nvim ];
      })
    ];
    extraConfigLua = ''
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
        }
      })
      require("codestats").setup({
        username = os.getenv("CODE_STATS_USERNAME"),
        base_url = os.getenv("CODE_STATS_BASE_URL"),
        api_key = os.getenv("CODE_STATS_API"),
        send_on_exit = true,
        send_on_timer = true,
        timer_interval = 10000,
        curl_timeout = 5,
      })
    '';
  };
}
