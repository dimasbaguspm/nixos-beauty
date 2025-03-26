{
  programs.nixvim = {
    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          theme = "wave";
          transparent = true;
          colors = {
            theme = {
              wave = {
                ui = {
                  bg_gutter = "none";
                  float = {
                    bg = "none";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
