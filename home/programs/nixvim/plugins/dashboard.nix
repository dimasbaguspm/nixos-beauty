{userMetaData, ...}: let
  headers = {
    kyrielle = [
      ""
      "██╗  ██╗██╗   ██╗██████╗ ██╗███████╗██╗     ██╗     ███████╗"
      "██║ ██╔╝╚██╗ ██╔╝██╔══██╗██║██╔════╝██║     ██║     ██╔════╝"
      "█████╔╝  ╚████╔╝ ██████╔╝██║█████╗  ██║     ██║     █████╗  "
      "██╔═██╗   ╚██╔╝  ██╔══██╗██║██╔══╝  ██║     ██║     ██╔══╝  "
      "██║  ██╗   ██║   ██║  ██║██║███████╗███████╗███████╗███████╗"
      "╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚══════╝╚══════╝"
      ""
      ""
    ];
    leshia = [
      ""
      "██╗     ███████╗███████╗██╗  ██╗██╗ █████╗ "
      "██║     ██╔════╝██╔════╝██║  ██║██║██╔══██╗"
      "██║     █████╗  ███████╗███████║██║███████║"
      "██║     ██╔══╝  ╚════██║██╔══██║██║██╔══██║"
      "███████╗███████╗███████║██║  ██║██║██║  ██║"
      "╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝"
      ""
      ""
    ];
    silvia = [
      ""
      "███████╗██╗██╗    ██╗   ██╗██╗ █████╗ "
      "██╔════╝██║██║    ██║   ██║██║██╔══██╗"
      "███████╗██║██║    ██║   ██║██║███████║"
      "╚════██║██║██║    ╚██╗ ██╔╝██║██╔══██║"
      "███████║██║███████╗╚████╔╝ ██║██║  ██║"
      "╚══════╝╚═╝╚══════╝ ╚═══╝  ╚═╝╚═╝  ╚═╝"
      ""
    ];
  };
  header = headers."${userMetaData.name}";
in {
  programs.nixvim.plugins = {
    dashboard = {
      enable = true;
      settings = {
        change_to_vcs_root = true;
        theme = "hyper";
        config = {
          inherit header;
          packages.enable = false;
          project.enable = false;
          shortcut = [
            {
              desc = " ${userMetaData.env.GIT_EMAIL}";
              group = "DashboardShortCut";
            }
            {
              desc = "  ${userMetaData.env.GIT_USERNAME}";
              group = "DashboardShortCut";
            }
          ];
          disable_move = false;
          week_header.enable = false;
          mru = {
            cwd_only = true;
            limit = 5;
          };
          footer = [
            ""
            ""
            "@dimasbaguspm 🤪"
          ];
        };
      };
    };
  };
}
