{pkgs, ...}: let
  packages = with pkgs; [
    nodejs_20
    corepack_20
  ];
in
  pkgs.mkShell {
    name = "node";
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
