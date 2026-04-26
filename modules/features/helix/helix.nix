{ self, inputs, ... }:
{
  flake.homeModules.helix =
    { pkgs, ... }:
    {
      programs.helix = {
        enable = true;

        languages.language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = pkgs.lib.getExe pkgs.nixfmt;
          }
          {
            name = "elixir";
            auto-format = true;
          }
        ];
        settings = {
          theme = "gruvbox";

          editor = {
            line-number = "relative";
            cursorline = true;
          };
        };
      };
    };
}
