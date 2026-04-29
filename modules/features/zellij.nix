{ self, inputs, ... }:
{
  flake.homeModules.zellij =
    { pkgs, config, ... }:
    let
      zjstatus = inputs.zjstatus.packages.${pkgs.system}.default;
    in
    {
      programs.zellij = {
        enable = true;
        enableZshIntegration = true;

        settings = {
          show_startup_tips = false;
          default_layout = "dev";
          theme = "catppuccin-mocha";
          plugins = {
            zjstatus.location = "file:${zjstatus}/bin/zjstatus.wasm";
          };
          layout_dir = "${config.xdg.configHome}/zellij/layouts";

        };
      };
      xdg.configFile."zellij/layouts".source = ../../config/zellij;
    };
}
