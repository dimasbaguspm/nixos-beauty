_: let
  inherit (import ../../.config.nix) username;
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
