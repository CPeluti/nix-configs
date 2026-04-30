{self, inputs, ...}: {
  flake.homeModules.music = 
    { pkgs, nixpkgs, ... }: {
      nixpkgs.config.allowUnfreePredicate = (pkg: true);
      home.packages = [
        pkgs.spotify-player
        pkgs.spotify
        pkgs.flac
        pkgs.shntool
        pkgs.cuetools
        # (pkgs.python313Packages.beets.override {
        #   pluginOverrides = {
        #     alternatives = {
        #       enable = true;
        #       propagatedBuildInputs = [ pkgs.python313Packages.beets-alternatives ];
        #     };
        #   };
        # })
      ];
     
    };
}
