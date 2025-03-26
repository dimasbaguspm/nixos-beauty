{userEnv, ...}: {
  programs = {
    git = {
      enable = true;
      userEmail = userEnv.GIT_EMAIL;
      userName = userEnv.GIT_USERNAME;
      extraConfig = {
        safe = {
          directory = "*";
        };
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper = {enable = true;};
    };

    lazygit = {enable = true;};
  };
}
