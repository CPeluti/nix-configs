{ self, ... }:
{
  flake.homeModules.yazi = {
    programs.yazi = {
      enable = true;
    };
    xdg.configFile."yazi/yazi.toml".source = ../../config/yazi/yazi.toml;
  };
}
