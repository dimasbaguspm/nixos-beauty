{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./network.nix
    ./security.nix
    ./nix.nix
    ./timezone.nix
    ./internationalization.nix
    ./home-manager.nix
    ./desktop-manager.nix
    ./programs.nix
    ./users.nix
  ];

  hardware.pulseaudio.enable = false;

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
