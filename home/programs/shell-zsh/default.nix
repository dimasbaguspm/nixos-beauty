{config, ...}: {
  programs.zsh = {
    enable = true;
    initExtra = ''
      export VISUAL=nvim
      export EDITOR=nvim

      export CODE_STATS_API=$(cat ${config.sops.secrets.CODE_STATS_API.path})
      export WAKATIME_API_KEY=$(cat ${config.sops.secrets.WAKATIME_API_KEY.path})

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
