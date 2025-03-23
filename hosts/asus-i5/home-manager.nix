{ nixvim, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = { kyrielle = import ../../home; };
    sharedModules = [ nixvim.homeManagerModules.nixvim ];
  };
}
