{ nixvim, pkgs, currentUser, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      kyrielle = import ../../home {
        username = "kyrielle";
        args = { inherit pkgs currentUser; };
      };
    };
    sharedModules = [ nixvim.homeManagerModules.nixvim ];
  };
}
