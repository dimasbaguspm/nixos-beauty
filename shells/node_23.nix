{pkgs, ...}: let
  packages = with pkgs; [
    nodejs_23
    corepack_23
  ];
in
  pkgs.mkShell {
    name = "node_23";
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
