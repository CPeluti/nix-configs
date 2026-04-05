{self, inputs, config, ...}: {
  flake.nixosConfigurations.homelab = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.homelabConfiguration
      self.nixosModules.niri
      self.nixosModules.vpn
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.users.caio = {
          imports = [
            config.flake.homeModules.caio
          ];
        };
      }
    ];
  };
}