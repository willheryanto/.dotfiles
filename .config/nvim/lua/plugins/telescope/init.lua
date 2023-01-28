return {
  {
    "nvim-telescope/telescope.nvim",
    priority = 100,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "AckslD/nvim-neoclip.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("neoclip").setup()
      require("plugins.telescope.keymaps").on_attach()

      local actions = require "telescope.actions"

      require("telescope").setup {
        defaults = {
          mappings = {
            n = {
              ["<C-e>"] = actions.results_scrolling_down,
              ["<C-y>"] = actions.results_scrolling_up,
            },
          },

          selection_strategy = "reset",
          sorting_strategy = "descending",
          scroll_strategy = "cycle",
        },

        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },

            mappings = {
              n = {
                ["kj"] = "close",
              },
            },
          },
        },
      }

      _ = require("telescope").load_extension "file_browser"
      _ = require("telescope").load_extension "neoclip"
      _ = require("telescope").load_extension "notify"
      _ = require("telescope").load_extension "fzf"
    end,
  },
}
