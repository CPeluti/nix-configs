{ self, inputs, ... }:
{
  flake.homeModules.zellij =
    { pkgs, ... }:
    {
      programs.zellij = {
        enable = true;
        enableZshIntegration = true;

        settings = {
          theme = "catppuccin-mocha";
          default_layout = "compact";
          pane_frames = false;
        };

      };
    };
}
