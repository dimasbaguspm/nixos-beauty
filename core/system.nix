{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "days";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "24.11";
}
