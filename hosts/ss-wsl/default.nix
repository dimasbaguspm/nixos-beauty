{userMetaData, ...}: {
  imports = [
    ../../home
    ../../core
  ];

  wsl = {
    enable = true;
    defaultUser = userMetaData.name;
    startMenuLaunchers = true;
    wslConf = {
      network = {
        hostname = "ss-wsl";
      };
    };
  };
}
