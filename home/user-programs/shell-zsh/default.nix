{
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
