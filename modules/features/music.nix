{self, inputs, ...}: {
  flake.homeModules.music = 
    { pkgs, nixpkgs, ... }: {
      nixpkgs.config.allowUnfreePredicate = (pkg: true);
      home.packages = [pkgs.spotify-player pkgs.spotify];
      services.spotifyd = {
        enable = true;
        settings = {
          global = {
            device_name = "nixos";
            bitrate = 320;
          };
        };
      };
    };
}