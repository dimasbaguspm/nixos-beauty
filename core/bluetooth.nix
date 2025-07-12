{ pkgs, ... }:
{
  # Enable Bluetooth support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Power on the Bluetooth controller on boot
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true; # Enable experimental features like battery level reporting
      };
    };
  };

  # Enable Bluetooth manager service
  services.blueman.enable = true;

  # Add Bluetooth packages to system
  environment.systemPackages = with pkgs; [
    bluez # Bluetooth protocol stack
    bluez-tools # Additional Bluetooth utilities
    bluetuith # TUI Bluetooth manager (alternative to blueman)
  ];

  # Enable PulseAudio/PipeWire Bluetooth support
  services.pulseaudio.package = pkgs.pulseaudioFull;

  # Add user to lp group for Bluetooth access
  users.groups.lp = { };
}
