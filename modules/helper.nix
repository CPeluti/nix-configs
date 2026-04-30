{self, inputs, ...}: {
  flake = {
    lib.mkHome = {username, homeDir, homeModule}: {
      home-manager.users.${username} ={
        imports = [homeModule];
        home = {
          username = username;
          homeDirectory = homeDir;
        };
      };
    };
  };
}