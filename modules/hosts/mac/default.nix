{self, inputs, config, ...}: {
  flake.darwinConfigurations."MacBook-Air-de-Caio" = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.macConfiguration
      inputs.home-manager.darwinModules.home-manager
      (self.lib.mkHome {
        username = "caio";
        homeDir = "/Users/caio";
        homeModule = config.flake.homeModules.caio;
      })
    ];
  };
}