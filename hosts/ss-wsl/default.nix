_: let
  globalConfig = import ../../.config.nix;
  username = globalConfig.currentUser;
in {
  imports = [
    ../../home
    ../../core
  ];

  wsl = {
    enable = true;
    defaultUser = username;
    startMenuLaunchers = true;
    wslConf = {
      network = {
        hostname = "ss-wsl";
      };
    };
  };
}
