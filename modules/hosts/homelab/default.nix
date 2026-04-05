{self, inputs, config, ...}: {
  flake.nixosConfigurations.homelab = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.homelabConfiguration
      self.nixosModules.niri
      self.nixosModules.vpn
      self.nixosModules.virtualisation
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