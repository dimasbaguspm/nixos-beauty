{
  imports = [
    ./setting.nix
    ./highlight.nix

    ./themes/kanagawa.nix

    ./plugins/search-and-replace.nix
    ./plugins/lazy-load.nix
    ./plugins/indent.nix
    ./plugins/breadcrumb.nix
    ./plugins/focus.nix
    ./plugins/auto-pairs.nix
    ./plugins/animation.nix
    # ./plugins/supermaven.nix
    ./plugins/copilot.nix
    ./plugins/code-tracker.nix
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
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };
    clipboard = {
      register = "unnamedplus";
      providers = {wl-copy.enable = true;};
    };
  };
}
