{self, inputs, ...}: {
  flake.homeModules.dev = 
    { pkgs, inputs, ... }: {
      imports = [
        ./neovim/module.nix
      ];
      wrappers.neovim.enable = true;
      home.packages = [
        pkgs.zed-editor
        pkgs.vscode
        pkgs.nil
        pkgs.nixd
      ];
    };
}
