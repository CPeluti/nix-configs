{self, inputs, ...}: {
  flake.homeModules.music = 
    { pkgs, nixpkgs, ... }: {
      nixpkgs.config.allowUnfreePredicate = (pkg: true);
      home.packages = [
        pkgs.spotify-player
        pkgs.spotify
        pkgs.flac
        (pkgs.python313Packages.beets.override {
          pluginOverrides = {
            alternatives = {
              enable = true;
              propagatedBuildInputs = [ pkgs.python313Packages.beets-alternatives ];
            };
          };
        })
      ];
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
