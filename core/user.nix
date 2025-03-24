{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      kyrielle = {
        isNormalUser = true;
        description = "Kyrielle";
        extraGroups = [ "networkmanager" "wheel" ];
      };
      silvia = {
        isNormalUser = true;
        description = "Silvia";
        extraGroups = [ "networkmanager" "wheel" ];
      };
      leshia = {
        isNormalUser = true;
        description = "Leshia";
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };
}
