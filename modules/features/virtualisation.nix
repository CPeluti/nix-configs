{self, inputs, ...}: {
  flake.nixosModules.virtualisation = 
    { pkgs, ... }: {
      virtualisation.docker.enable = true;
      virtualisation.docker.enableOnBoot = true;
    };
}