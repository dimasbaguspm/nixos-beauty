{pkgs, ...}: let
  venvDir = ".venv";
  packages = with pkgs;
    [
      python312
    ]
    ++ (with pkgs.python311Packages; [
      pip
      venvShellHook
    ]);
in
  pkgs.mkShell {
    name = "python";
    inherit venvDir;
    inherit packages;
    shellHook = ''

      echo "Welcome to the python shell!"

      echo ""
      echo "Installed packages:"
      echo "Python version: `python --version`"
      echo "pip"
      echo ""
      echo "You can run any node command with 'python'"

      exec zsh
    '';
  }
