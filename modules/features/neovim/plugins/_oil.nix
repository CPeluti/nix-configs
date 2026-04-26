{...}: {
  nvf.settings.vim.lazy.plugins = {
    "oil-nvim" = {
      package = "oil-nvim";

      # ıf your plugin uses the `require('your-plugin').setup{...}` pattern
      setupModule = "oil";
      lazy = true;
      # Events that trigger this plugin to be loaded
      # Plugin Keymaps
      keys = [
        # We'll cover this in detail in the 'keybinds' section
        {
          key = "-";
          mode = "n";
          action = ":<CMD>Oil<CR>";
        }
      ];
    };
  };
}