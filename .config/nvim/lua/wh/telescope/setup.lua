local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions = require "telescope.actions"

telescope.setup {
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
