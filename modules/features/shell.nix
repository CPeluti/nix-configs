{self, inputs, ...}: {
  flake.homeModules.shell = 
    { pkgs, ... }: {
      home.packages = [pkgs.just];
      programs.zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "z"
            "direnv"
          ];
          theme = "robbyrussell";
        };
      };
    };
}