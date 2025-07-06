{
  nixpkgs.config.allowUnfree = true;

  # Hardware configuration for gaming
  hardware = {
    steam-hardware.enable = true; # Enable Steam Controller and Valve Index support
    graphics = {
      enable = true;
      enable32Bit = true; # Enable 32-bit graphics support for older games
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
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
