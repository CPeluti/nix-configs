{self, inputs, ...}: {
  flake.nixosModules.virtualisation = 
    { pkgs, ... }: {
      virtualisation.podman.enable = true;
      virtualisation.podman.dockerCompat = true;
    };
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
}