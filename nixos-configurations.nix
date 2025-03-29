{
  inputs,
  userMetaData,
}: {
  asus-i5 = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs userMetaData;
    };
    modules = [
      inputs.nixvim.nixosModules.nixvim
      inputs.home-manager.nixosModules.home-manager
      ./hosts/asus-i5
    ];
  };

  ss-wsl = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs userMetaData;
    };
    modules = [
      inputs.nixvim.nixosModules.nixvim
      inputs.home-manager.nixosModules.home-manager
      inputs.nixos-wsl.nixosModules.default
      ./hosts/ss-wsl
    ];
  };
}
