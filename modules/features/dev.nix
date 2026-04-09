{self, inputs, ...}: {
  flake.homeModules.dev = 
    { pkgs, ... }: {
      home.packages = [
        pkgs.zed-editor
        pkgs.vscode
      ];
    };
}