{self, inputs, ...}: {
  flake.homeModules.remoteAccess = 
    { pkgs, ... }: {
      home.packages = [pkgs.filezilla pkgs.rclone];
    };
}