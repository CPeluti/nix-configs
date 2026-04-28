{ self, ... }:
{
  flake.homeModules.yazi = {
    programs.yazi = {
      enable = true;
      settings = {
        mgr = {
          keymap = [
            {
              on = "<Enter>";
              run = "shell 'echo $@'";
            }
          ];
          ratio = [
            0
            1
            0
          ];
        };
      };
    };
  };
}
