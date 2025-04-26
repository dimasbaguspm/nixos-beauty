{
  programs.nixvim = {
    plugins = {
      grug-far.enable = true;
    };
    keymaps = [
      {
        key = "<leader>gr";
        action = "<cmd>GrugFar<cr>";
        mode = "n";
        options.desc = "Open GrugFar";
      }
    ];
  };
}
