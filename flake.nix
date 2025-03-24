{
  description = "dimasbaguspm purgatory";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      # NOTE: change the user name to your username
      # Kyrielle - primary personal user
      # Silvia - secondary personal user
      # Leshia - primary work user
      currentUser = "kyrielle";

      # NOTE: hostname information
      # asus-i7 - primary personal user
      # asus-i5 - secondary personal user
      # ss-hp-pavilion - primary work user
      currentHost = "asus-i5";
    in {
      nixosConfigurations = {
        asus-i5 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit nixvim currentUser currentHost; };
          modules = [
            nixvim.nixosModules.nixvim
            home-manager.nixosModules.home-manager
            ./hosts/asus-i5
          ];
        };
      };
    };
}
