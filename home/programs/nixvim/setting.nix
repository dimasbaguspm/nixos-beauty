{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
    };
    keymaps = [
      {
        key = "<C-h>";
        action = "<C-w>h";
        mode = "n";
        options.desc = "Move to left window";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        mode = "n";
        options.desc = "Move to down window";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
        mode = "n";
        options.desc = "Move to up window";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        mode = "n";
        options.desc = "Move to right window";
      }

      {
        key = "|";
        action.__raw = ''
          vim.cmd.vsplit
        '';
        mode = "n";
        options.desc = "Split Vertically";
      }
      {
        key = "-";
        action.__raw = ''
          vim.cmd.split
        '';
        mode = "n";
        options.desc = "Split Horizontally";
      }
    ];
  };
}
