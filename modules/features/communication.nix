{self, inputs, ...}: {
  flake.homeModules.communication = 
    { pkgs, ... }: {
      home.packages = [
        pkgs.telegram-desktop
        pkgs.vesktop
      ];
    };
}