{pkgs, ...}: {
  # Enable Docker service
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
    # Enable Docker daemon socket for rootless access
    daemon.settings = {
      data-root = "/var/lib/docker";
    };
  };

  # Install Docker and related packages system-wide
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    docker-buildx
  ];

  # Enable container runtime
  virtualisation.containers.enable = true;
}
