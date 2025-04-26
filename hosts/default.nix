{inputs, ...}: let
  inherit (import ../.config.nix) system;
in {
  asus-i5 = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs;
    };
    modules = [
      inputs.nixvim.nixosModules.nixvim
      inputs.home-manager.nixosModules.home-manager
      inputs.sops-nix.nixosModules.sops
      ./asus-i5
    ];
  };

  ss-wsl = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs;
    };
    modules = [
      inputs.nixvim.nixosModules.nixvim
      inputs.home-manager.nixosModules.home-manager
      inputs.nixos-wsl.nixosModules.default
      inputs.sops-nix.nixosModules.sops
      ./ss-wsl
    ];
  };
}
