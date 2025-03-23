{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      kyrielle = {
        isNormalUser = true;
        description = "Kyrielle";
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };
}
