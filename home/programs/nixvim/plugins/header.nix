{
  programs.nixvim.plugins = {
    bufferline = {
      enable = true;
      settings = {
        options.__raw = ''
          {
            indicator = {
              style = "none",
            },
            style = "none",
            mode = "buffers",
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = "bdelete! %d",
            buffer_close_icon = "x",
            modified_icon = "",
            close_icon = "X",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 15,
            truncate_names = false,
            tab_size = 15,
            diagnostics = false,
            show_buffer_icons = false,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = false,
            show_duplicate_prefix = true,
            persist_buffer_sort = true,
            separator_style = "none",
            always_show_bufferline = true,
          }
        '';
      };
    };
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<A-.>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {desc = "Cycle to next buffer";};
    }

    {
      mode = "n";
      key = "<A-,>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {desc = "Cycle to previous buffer";};
    }

    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {desc = "Cycle to next buffer";};
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {desc = "Cycle to previous buffer";};
    }

    {
      mode = "n";
      key = "<A-c>";
      action = "<cmd>bdelete<cr>";
      options = {desc = "Close buffer";};
    }

    {
      mode = "n";
      key = "<A-w>";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {desc = "Wipeout all buffers except current";};
    }

    {
      mode = "n";
      key = "<A-p>";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {desc = "Toggle pin";};
    }
  ];
}
