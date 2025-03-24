{ currentUser, ... }:
let
  settings = {
    "kyrielle" = import ./kyrielle;
    "leshia" = import ./leshia;
    "silvia" = import ./silvia;
  };

  selectedSettings = settings.${currentUser}.userVars;
in selectedSettings
