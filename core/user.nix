{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      kyrielle = {
        isNormalUser = true;
        description = "Kyrielle";
        extraGroups = ["networkmanager" "wheel" "docker"];
      };
      silvia = {
        isNormalUser = true;
        description = "Silvia";
        extraGroups = ["networkmanager" "wheel" "docker"];
      };
      leshia = {
        isNormalUser = true;
        description = "Leshia";
        extraGroups = ["networkmanager" "wheel" "docker"];
      };
      kaluna = {
        isNormalUser = true;
        description = "Kaluna";
        extraGroups = ["networkmanager" "wheel" "docker"];
      };
    };
  };
}
