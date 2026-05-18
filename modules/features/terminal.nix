{self, inputs, ...}: {
  flake.homeModules.terminal = 
    { pkgs, ... }: {
      programs.wezterm = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        extraConfig = builtins.readFile ../../config/wezterm/wezterm.lua;
      };
    };
}
