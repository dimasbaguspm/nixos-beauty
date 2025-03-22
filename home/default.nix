{config,pkgs, ...}:

{
  home = {
    username = "kyrielle";
    homeDirectory = "/home/kyrielle";
    packages = with pkgs; [
      neofetch
      neovim

      starship
      lazygit

      zoxide
      yazi

      ripgrep
      fzf
      jq
      fd
      bat
    ];
    stateVersion = "25.05";
  };

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

  programs.git = {
    enable = true;
    userEmail = "dimas.bagus.pm1@gmail.com";
    userName = "dimasbaguspm";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    autocd = true;

    shellAliases = {
      g = "git";
      e = "$EDITOR";
      lg = "lazygit";
      yz = "yazi";
      db = "harlequin";
      cal = "calcure";
      post = "posting";
      lsa = "ls -la";
      dev = "echo \"use nix\" > .envrc && direnv allow";
      ".." = "cd ..";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
