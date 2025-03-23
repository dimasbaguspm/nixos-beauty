{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.supermaven-nvim ];
    extraConfigLua = ''
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
        }
      })
    '';
  };
}
