{
  programs = {
    git.enable = true;
    firefox.enable = true;
    zsh.enable = true;

    # Steam configuration
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true; # Enable gamescope compositor for better gaming experience
    };

    # Enable gamescope compositor
    gamescope = {
      enable = true;
      capSysNice = true; # Allow gamescope to set process priority
    };
  };
}
