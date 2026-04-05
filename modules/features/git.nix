# user.nix (name doesn't matter)
{
  self,
  inputs,
  ...
}: {
  flake.homeModules.git = {...}: {
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      settings.user.email = "cpeluti@gmail.com";
      settings.user.name = "Caio Peluti";
    };
  };
}