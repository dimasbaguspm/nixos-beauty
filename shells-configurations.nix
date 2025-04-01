{inputs, ...}: let
  pkgs = import inputs.nixpkgs {
    system = "x86_64-linux";
  };
in {
  node = import ./shells/node.nix {inherit pkgs;};
}
