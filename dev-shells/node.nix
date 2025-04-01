{pkgs, ...}: let
  packages = with pkgs; [
    nodejs_22
    corepack_22
  ];
in
  pkgs.mkShell {
    inherit packages;
    shellHook = ''

      echo "Welcome to the node shell!"

      echo ""
      echo "Installed packages:"
      echo "Node version: `node -v`"
      echo ""
      echo "You can run any node command with 'node'"

      exec zsh
    '';
  }
