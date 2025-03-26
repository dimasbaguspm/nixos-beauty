{currentUser, ...}: {
  imports = [
    ../../home
    ../../core
  ];

  wsl = {
    enable = true;
    defaultUser = currentUser;
    startMenuLaunchers = true;
    wslConf = {
      network = {
        hostname = "ss-wsl";
      };
    };
  };
}
