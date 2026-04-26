{...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "multicursors-nvim" = {
      package = "multicursors-nvim";

      setupModule = "multicursors";
      lazy = true;
      keys = [
        {
          mode = ["n" "x"];
          key = "<up>";
          action = "function() mc.lineAddCursor(-1) end";
        }
        {
          mode = ["n" "x"];
          key = "<down>";
          action = "function() mc.lineAddCursor(1) end";
        }
        {
          mode = ["n" "x"];
          key = "<leader><up>";
          action = "function() mc.lineSkipCursor(-1) end";
        }
        {
          mode = ["n" "x"];
          key = "<leader><down>";
          action = "function() mc.lineSkipCursor(1) end";
        }
        {
          mode = ["n" "x"];
          key = "<leader>n";
          action = "function() mc.matchAddCursor(1) end";
        }
        {
          mode = ["n" "x"];
          key = "<leader>s";
          action = "function() mc.matchSkipCursor(1) end";
        }
        {
          mode = ["n" "x"];
          key = "<leader>N";
          action = "function() mc.matchAddCursor(-1) end";
        }
        {
          mode = ["n" "x"];
          key = "<leader>S";
          action = "function() mc.matchSkipCursor(-1) end";
        }
      ];
    };
  };
}