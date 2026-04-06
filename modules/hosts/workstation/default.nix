{self, inputs, config, ...}: {
  flake.nixosConfigurations.workstation = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.workstationConfiguration
      self.nixosModules.niri
      self.nixosModules.browser
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