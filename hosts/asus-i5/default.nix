{
  imports = [
    ../../core
    ../../users

    ./hardware-configuration.nix
    ./boot.nix
    ./network.nix
    ./security.nix
    ./timezone.nix
    ./internationalization.nix
    ./desktop-manager.nix
  ];

  hardware.pulseaudio.enable = false;

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
