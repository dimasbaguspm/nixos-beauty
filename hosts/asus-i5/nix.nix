{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      CODE_STATS_BASE_URL = "https://codestats.net";
      CODE_STATS_USERNAME = "dimasbaguspm";
      CODE_STATS_API =
        "SFMyNTY.WkdsdFlYTmlZV2QxYzNCdCMjTWpVeE1EUT0.kWTeZEGOsAvznr_mMiWYMzCgPzy8gYwE01teL8AJcyc";
    };
  };

  system.stateVersion = "24.11";
}
