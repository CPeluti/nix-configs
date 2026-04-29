{ self, inputs, ... }:
{
  flake.homeModules.neovim =
    { pkgs, ... }:
    {
      imports = [
        inputs.nvf.homeManagerModules.default
      ];
      programs.nvf = {
        enable = true;
        # your settings need to go into the settings attribute set
        # most settings are documented in the appendix
        settings = {
          vim.theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
          };

          vim.projects.project-nvim.enable = true;
          vim.navigation.harpoon.enable = true;
          vim.autopairs.nvim-autopairs.enable = true;
          vim.telescope.enable = true;
          vim.autocomplete.blink-cmp.enable = true;
          vim.statusline.lualine.enable = true;
          vim.binds.whichKey.enable = true;
          vim.utility.motion.flash-nvim.enable = true;
          vim.utility.oil-nvim.enable = true;
          vim.utility.smart-splits.enable = true;
          vim.utility.multicursors.enable = true;
          vim.filetree.neo-tree.enable = true;
          vim.mini.surround.enable = true;
          vim.git.enable = true;

          vim.utility.motion.flash-nvim.mappings.jump = "<CR>";

          vim.lsp.enable = true;
          vim.lsp.formatOnSave = true;

          vim.languages = {
            enableTreesitter = true;
            nix.enable = true;
            nix.format.type = [ "nixfmt" ];
          };
          vim.opts.tabstop = 2;
          vim.opts.shiftwidth = 2;
          vim.viAlias = false;
          vim.vimAlias = true;

          vim.keymaps = [
            {
              mode = [ "n" ];
              key = "<C-y>";
              action = "<CMD>:Neotree toggle<CR>";
              desc = "Toggle Neotree";
            }
            {
              mode = [ "n" ];
              key = "<M-y>";
              action = "<CMD>:Neotree focus<CR>";
              desc = "Focus Neotree";
            }
            {
              mode = [ "n" ];
              key = "<leader>gg";
              action = "<CMD>:G<CR>";
              desc = "Open Fugitive";
            }
            {
              mode = [ "n" ];
              key = "-";
              action = "<CMD>Oil<CR>";
              desc = "Open Oil file manager";
            }
          ];
        };
      };
    };
}
