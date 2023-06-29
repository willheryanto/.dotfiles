local M = {}

local utils = require("wh.utils")

M.config = function()
  local actions = require("telescope.actions")
  return {
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
end

M.mappings = function()
  local Mapper = require("plugins.telescope.mapper")

  local maps = {
    { "<leader>en", Mapper.pick_telescope("edit_neovim"), desc = "Edit Neovim" },
    { "<leader>ez", Mapper.pick_telescope("edit_zsh"), desc = "Edit zsh" },
    { "<leader>fd", Mapper.pick_telescope("find_files"), desc = "Find files" },
    { "<leader>fe", Mapper.pick_telescope("file_browser"), desc = "File browser" },
    { "<leader>fw", Mapper.pick_telescope("file_browser_from_current_buffer"), desc = "File browser from current browser" },
    { "<leader>fp", Mapper.pick_telescope("file_browser_project"), desc = "File browser project" },
    { "<leader>fz", Mapper.pick_telescope("search_only_certain_files"), desc = "Search only certain files" },
    { "<leader>fg", Mapper.pick_telescope("live_grep"), desc = "Live grep" },
    { "<leader>fa", Mapper.pick_telescope("aerial"), desc = "Find Aerial" },
  }

  for _, value in ipairs(maps) do
    utils.keymap(value)
  end
end

M.setup = function(_, opts)
  require("neoclip").setup()

  require("telescope").setup(M.config())

  _ = require("telescope").load_extension("file_browser")
  _ = require("telescope").load_extension("neoclip")
  _ = require("telescope").load_extension("notify")
  _ = require("telescope").load_extension("fzf")
  _ = require("telescope").load_extension("aerial")

  M.mappings()
end

return M
