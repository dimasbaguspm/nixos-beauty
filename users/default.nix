{ currentUser, ... }:
let
  settings = {
    "kyrielle" = import ./kyrielle;
    "leshia" = import ./leshia;
    "silvia" = import ./silvia;
  };
in { imports = [ settings.${currentUser} or [ ] ]; }
