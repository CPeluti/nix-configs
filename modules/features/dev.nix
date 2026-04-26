{ self, inputs, ... }:
{
  flake.homeModules.dev =
    { pkgs, ... }:
    {
      programs.home-manager.enable = true;

      home.packages = [
        pkgs.zed-editor
        pkgs.vscode
        pkgs.nil
        pkgs.nixd
        pkgs.yazi
        pkgs.lazygit
        pkgs.zoxide
        pkgs.beam27Packages.elixir-ls
      ];
    };
}
