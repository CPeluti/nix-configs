{self, inputs, ...}: {
  flake.homeModules.browser = 
    { pkgs, ... }: {
      programs.home-manager.enable = true;

      imports = [
        inputs.zen-browser.homeModules.beta
      ];
      programs.zen-browser = {
        enable = true;
        # any other options under `programs.firefox` are also supported here.
        # see `man home-configuration.nix`.
        policies = {
          certificates = {
            ImportEnterpriseRoots = true;
          };
        };
      };
    };
}