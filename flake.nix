{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      asus-i5 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      modules = [
          ./hosts/asus-i5
          nixvim.nixosModules.nixvim
	        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kyrielle = import ./home;
            home-manager.sharedModules = [
              nixvim.homeManagerModules.nixvim
            ];
          }
	      ];
      };
    };
  };
}
