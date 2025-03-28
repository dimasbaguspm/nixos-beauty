{
  description = "dimasbaguspm purgatory";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: let
    # NOTE: change the user name to your username
    # kyrielle - primary personal user
    # silvia - secondary personal user
    # leshia - primary work user
    currentUser = "kyrielle";

    userMetaData = {
      name = currentUser;
      env = import ./users {inherit currentUser;};
    };
  in {
    nixosConfigurations = import ./nixos-configurations.nix {
      inherit inputs userMetaData;
    };
  };
}
