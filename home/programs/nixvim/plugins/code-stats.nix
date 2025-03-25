{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "codestats";
        src = pkgs.fetchFromGitHub {
          owner = "liljaylj";
          repo = "codestats.nvim";
          rev = "041b315c4f82997186fcdb3fc2f687cc128a28f3";
          hash = "sha256-00yy4Ftk5LLxoWJwjggJcJvkQLkvGhOuXxgyBGi9Pig=";
        };
        dependencies = [pkgs.vimPlugins.plenary-nvim];
      })
    ];
    extraConfigLua = ''
       require("codestats").setup({
         username = os.getenv("CODE_STATS_USERNAME"),
         base_url = os.getenv("CODE_STATS_BASE_URL"),
         api_key = os.getenv("CODE_STATS_API"),
         send_on_exit = true,
         send_on_timer = true,
         timer_interval = 10000,
         curl_timeout = 5,
      })
    '';
  };
}
