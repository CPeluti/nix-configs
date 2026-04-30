{self, inputs, ...}: {
  flake.homeModules.remoteAccess = 
    { pkgs, ... }: {
      home.packages = [pkgs.rclone];
    };
}