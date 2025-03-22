{config,pkgs, ...}:

{
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes = {
      kanagawa.enable = true;
    };
    plugins = {
      yazi = {
        enable = true;
        autoLoad = true;
      };
      which-key = {
        enable = true;
        autoLoad = true;
      };
      web-devicons = {
        enable = true;
        autoLoad = true;
      };
    };
    keymaps = [
      {
        key = "<leader>ee";
        mode = "n";
        action = "<cmd>Yazi<cr>";
        options.desc = "Open Explorer";
      }
    ];
    opts = {
      number = true;
      relativenumber = true;
    };
  };

  home = {
    username = "kyrielle";
    homeDirectory = "/home/kyrielle";
    packages = with pkgs; [
      neofetch

      starship
      lazygit

      zoxide
      yazi

      nerd-fonts.caskaydia-cove

      ripgrep
      fzf
      jq
      fd
      bat
    ];
    shell = {
      enableZshIntegration = true;
    };
    stateVersion = "25.05";
  };

  fonts = {
    fontconfig = {
      enable = true;
    };
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
      lsa = "ls -la";
      ".." = "cd ..";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
