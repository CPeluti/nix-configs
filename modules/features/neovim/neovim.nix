{self, inputs, nvf ...}: {
  flake.homeModules.neovim = 
    { pkgs, ... }: {
      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [configModule];
      };
      home.packages = [
        customNeovim.neovim
      ];
    };
}