{ pkgs, ... }: let
  lua = cmd: "<cmd>lua require('multicursor-nvim')." + cmd + "<CR>";
in {
  programs.nvf.settings.vim.lazy.plugins = {
    "multicursor.nvim" = {
      package = pkgs.vimPlugins.multicursor-nvim;

      setupModule = "multicursor-nvim";
      lazy = true;

      keys = [
        {
          mode = ["n" "x"];
          key = "<up>";
          action = lua "lineAddCursor(-1)";
        }
        {
          mode = ["n" "x"];
          key = "<down>";
          action = lua "lineAddCursor(1)";
        }
        {
          mode = ["n" "x"];
          key = "<leader><up>";
          action = lua "lineSkipCursor(-1)";
        }
        {
          mode = ["n" "x"];
          key = "<leader><down>";
          action = lua "lineSkipCursor(1)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>n";
          action = lua "matchAddCursor(1)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>s";
          action = lua "matchSkipCursor(1)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>N";
          action = lua "matchAddCursor(-1)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>S";
          action = lua "matchSkipCursor(-1)";
        }
      ];
    };
  };
}