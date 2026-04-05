{self, inputs, ...}: {
  flake.nixosModules.communication = 
    { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.discord
        pkgs.telegram-desktop
        pkgs.vesktop
      ];
    };
}