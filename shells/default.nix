{inputs, ...}: let
  globalConfig = import ../.config.nix;
  inherit (globalConfig) system;
in {
  "${system}" = let
    pkgs = import inputs.nixpkgs {
      inherit system;
    };
  in {
    node = import ./node.nix {inherit pkgs;};
    python = import ./python.nix {inherit pkgs;};
  };
}
