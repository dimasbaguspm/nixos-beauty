{ nixvim, pkgs, currentUser, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      "${currentUser}" =
        import ../home { args = { inherit pkgs currentUser; }; };
    };
    sharedModules = [ nixvim.homeManagerModules.nixvim ];
  };
}
