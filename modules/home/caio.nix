# user.nix (name doesn't matter)
{
  self,
  pkgs,
  inputs,
  ...
}: {

  flake.homeModules.caio = {...}: {
    
    programs.home-manager.enable = true;

    home = {
      username = "caio";
      homeDirectory = "/home/caio";
      sessionPath = ["$HOME/.local/bin"];
      stateVersion = "26.05";
    };

    imports = [
      self.homeModules.git
      self.homeModules.shell
    ];

  };
}