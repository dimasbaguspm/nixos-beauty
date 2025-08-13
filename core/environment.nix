{ pkgs, ... }:
let
  # Define the specific Playwright version
  playwrightVersion = "1.54.2";

  # Create custom Playwright package with specific version
  customPlaywright = pkgs.playwright-driver.overrideAttrs (oldAttrs: {
    version = playwrightVersion;
    src = pkgs.fetchFromGitHub {
      owner = "microsoft";
      repo = "playwright";
      rev = "v${playwrightVersion}";
      sha256 = "sha256-/kWwT3GJwzVEFq6ry/Nk1QXw4eNRlt7rehBziJsbAJw=";
    };
  });

  customPlaywrightBrowsers = pkgs.playwright-driver.browsers.overrideAttrs (oldAttrs: {
    version = playwrightVersion;
  });
in
{
  environment.systemPackages = with pkgs; [
    nodejs
    corepack
    cron
    nodePackages."@angular/cli"
    bun
    customPlaywrightBrowsers
    customPlaywright
  ];

  environment.variables = {
    PLAYWRIGHT_BROWSERS_PATH = "${customPlaywrightBrowsers}";
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  };
}
