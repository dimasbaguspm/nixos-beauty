{
  description = "dimasbaguspm purgatory";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      asus-i5 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit nixvim; };
        modules = [
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          ./hosts/asus-i5
        ];
      };
    };
  };
}
