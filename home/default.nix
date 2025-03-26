{
  currentUser,
  userEnv,
  pkgs,
  nixvim,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [nixvim.homeManagerModules.nixvim];
    extraSpecialArgs = {inherit userEnv;};
    users.${currentUser} = {
      home = {
        username = "${currentUser}";
        homeDirectory = "/home/${currentUser}";
        packages = with pkgs; [
          neofetch
          starship
          nerd-fonts.caskaydia-cove
          ripgrep
          fzf
          jq
          fd
          bat
        ];
        shell = {enableZshIntegration = true;};
        stateVersion = "25.05";
      };

      imports = [./programs];

      fonts = {fontconfig = {enable = true;};};

      programs.home-manager.enable = true;

      editorconfig = {
        enable = true;
        settings = {
          "*" = {
            charset = "utf-8";
            end_of_line = "lf";
            trim_trailing_whitespace = true;
            insert_final_newline = true;
            indent_style = "space";
            indent_size = 2;
          };
        };
      };
    };
  };
}
