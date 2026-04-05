{self, inputs, ...}: {
  flake.nixosModules.browser = 
    { pkgs, ... }: {
      environment.systemPackages = [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}