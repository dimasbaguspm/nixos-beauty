{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [pkgs.vimPlugins.hlchunk-nvim];
    extraConfigLua = ''
      require("hlchunk").setup({
        chunk = {
          enable = true
        },
        line_num = {
          enable = true
        }
      })
    '';
  };
}
