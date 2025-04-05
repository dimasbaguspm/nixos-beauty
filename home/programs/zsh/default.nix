{
  config,
  userMetaData,
  ...
}: {
  programs.zsh = {
    enable = true;
    initExtra = ''
      export VISUAL=nvim
      export EDITOR=nvim

      export ACCOUNT_NAME=${userMetaData.env.ACCOUNT_NAME}
      export GIT_USERNAME=${userMetaData.env.GIT_USERNAME}
      export GIT_EMAIL=${userMetaData.env.GIT_EMAIL}
      export CODE_STATS_USERNAME=${userMetaData.env.CODE_STATS_USERNAME}
      export CODE_STATS_BASE_URL=${userMetaData.env.CODE_STATS_BASE_URL}
      export CODE_STATS_API=$(cat ${config.sops.secrets.CODE_STATS_API.path})
      export WAKATIME_API_KEY=$(cat ${config.sops.secrets.WAKATIME_API_KEY.path})
      export NPM_TOKEN=$(cat ${config.sops.secrets.NPM_TOKEN_KEY.path})

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
