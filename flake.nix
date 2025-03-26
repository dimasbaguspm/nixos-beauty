{
  description = "dimasbaguspm purgatory";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    nixos-wsl,
    ...
  }: let
    # NOTE: change the user name to your username
    # Kyrielle - primary personal user
    # Silvia - secondary personal user
    # Leshia - primary work user
    currentUser = "kyrielle";
    userEnv = import ./users {inherit currentUser;};
  in {
    nixosConfigurations = {
      asus-i5 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit nixvim currentUser userEnv;};
        modules = [
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          ./hosts/asus-i5
        ];
      };

      ss-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit nixvim currentUser userEnv;};
        modules = [
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.default
          ./hosts/ss-wsl
        ];
      };
    };
  };
}
