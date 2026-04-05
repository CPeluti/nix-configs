{self, inputs, ...}: {
  flake.nixosModules.vpn = 
    { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.tailscale
        pkgs.proton-vpn
      ];
      services.tailscale.enable = true;
    };
}