{
  imports = [
    ../../home
    ../../core
  ];

  wsl = {
    enable = true;
    startMenuLaunchers = true;
    wslConf = {
      network = {
        hostname = "ss-wsl";
      };
    };
  };
}
