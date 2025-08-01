{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    corepack
    cron
    nodePackages."@angular/cli"
    bun
  ];
}
