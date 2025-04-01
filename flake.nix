{
  description = "nixos-beauty from dimasbaguspm";
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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: {
    nixosConfigurations = import ./nixos-configurations.nix {
      inherit inputs;
    };
    devShells."x86_64-linux" = import ./shells-configurations.nix {
      inherit inputs;
    };
  };
}
