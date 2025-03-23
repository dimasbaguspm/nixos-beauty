{ args, ... }: {
  home = {
    username = "${args.currentUser}";
    homeDirectory = "/home/${args.currentUser}";
    packages = with args.pkgs; [
      neofetch
      starship
      nerd-fonts.caskaydia-cove
      ripgrep
      fzf
      jq
      fd
      bat
    ];
    shell = { enableZshIntegration = true; };
    stateVersion = "25.05";
  };

  imports = [ ./user-programs ];

  fonts = { fontconfig = { enable = true; }; };

  programs.home-manager.enable = true;

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        trim_trailing_whitespace = true;
        insert_final_newline = true;
        indent_style = "space";
        indent_size = 2;
      };
    };
  };

}
