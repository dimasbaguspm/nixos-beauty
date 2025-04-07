{inputs, ...}: let
  inherit (import ../.config.nix) system;
in {
  "${system}" = let
    pkgs = import inputs.nixpkgs {
      inherit system;
    };
  in {
    node_23 = import ./node_23.nix {inherit pkgs;};
    node_22 = import ./node_22.nix {inherit pkgs;};
    node_20 = import ./node_20.nix {inherit pkgs;};
    node_18 = import ./node_18.nix {inherit pkgs;};

    python = import ./python.nix {inherit pkgs;};
  };
}
