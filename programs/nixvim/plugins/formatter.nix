{ pkgs, ... }: {
  programs.nixvim = {
    extraPackages = with pkgs; [ shfmt nixfmt stylua ];
    plugins.conform-nvim = {
      enable = true;

      lazyLoad.settings = {
        cmd = [ "ConformInfo" ];
        event = [ "BufWrite" ];
      };

      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;

        formatters_by_ft = {
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          bash = [ "shfmt" ];
        };
      };
    };
  };
}
