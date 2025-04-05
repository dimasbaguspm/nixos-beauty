{inputs, ...}: let
  inherit (import ../.config.nix) system;
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
