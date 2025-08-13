{
  networking.hostName = "asus-i5";
  networking.networkmanager.enable = true;

  networking.extraHosts = ''
    127.0.0.1 local.dimasbaguspm.com
  '';

}
