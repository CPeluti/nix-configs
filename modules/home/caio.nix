# user.nix (name doesn't matter)
{
  self,
  pkgs,
  inputs,
  ...
}:
{

  flake.homeModules.caio =
    { pkgs, ... }:
    {

      programs.home-manager.enable = true;

      home = {
        username = "caio";
        homeDirectory = "/home/caio";
        sessionPath = [ "$HOME/.local/bin" ];
        stateVersion = "26.05";
      };

      imports = [
        self.homeModules.git
        self.homeModules.shell
        self.homeModules.music
        self.homeModules.communication
        self.homeModules.remoteAccess
        self.homeModules.dev
        self.homeModules.terminal
        self.homeModules.browser
        self.homeModules.neovim
        self.homeModules.helix
        self.homeModules.zellij
        self.homeModules.yazi
      ];

    };
}
