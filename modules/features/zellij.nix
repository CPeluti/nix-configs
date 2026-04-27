{ self, inputs, ... }:
{
  flake.homeModules.zellij =
    { pkgs, ... }:
    let
      zjstatus = inputs.zjstatus.packages.${pkgs.system}.default;
    in
    {
      programs.zellij = {
        enable = true;
        enableZshIntegration = true;

        settings = {
          theme = "catppuccin-mocha";
          plugins = {
            zjstatus.path = "${zjstatus}/bin/zjstatus.wasm";
          };

        };
      };

      xdg.configFile."zellij/layouts/default.kdl".source = ../../config/zellij/dev.kdl;
    };
}
