local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local fb_actions = require("telescope").extensions.file_browser.actions

local M = {}

function M.edit_neovim()
  local opts_with_preview, opts_without_preview

  opts_with_preview = {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },

    attach_mappings = function(_, map)
      map("i", "<c-y>", set_prompt_to_entry_value)
      map("i", "<M-c>", function(prompt_bufnr)
        actions.close(prompt_bufnr)
        vim.schedule(function()
          require("telescope.builtin").find_files(opts_without_preview)
        end)
      end)

      return true
    end,
  }

  opts_without_preview = vim.deepcopy(opts_with_preview)
  opts_without_preview.previewer = false

  require("telescope.builtin").find_files(opts_with_preview)
end

function M.edit_zsh()
  local opts

  opts = {
    shorten_path = false,
    cwd = "~/.config/zsh/",
    prompt = "~ zsh ~",
    hidden = true,
  }
  require("telescope.builtin").find_files(opts)
end

function M.edit_tmux()
  local opts

  opts = {
    shorten_path = false,
    cwd = "~/.config/tmux/",
    prompt = "~ tmux ~",
    hidden = true,
  }
  require("telescope.builtin").find_files(opts)
end

function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.file_browser_from_current_buffer()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
    path = "%:p:h",
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.file_browser_project()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
    path = os.getenv("PROJECT_PATH"),

    mappings = {
      i = {
        ["<CR>"] = false,
      },
      n = {
        ["<CR>"] = false,
      },
    },

    attach_mappings = function(_, map)
      map("i", "<CR>", fb_actions.change_cwd)
      map("n", "<CR>", fb_actions.change_cwd)

      return true
    end,
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.aerial()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
  }

  require("telescope").extensions.aerial.aerial(opts)
end

function M.search_only_certain_files()
  require("telescope.builtin").find_files({
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input("Type: "),
    },
  })
end

-- return setmetatable({}, {
--   __index = function(_, k)
--     if M[k] then
--       return M[k]
--     else
--       return require("telescope.builtin")[k]
--     end
--   end,
-- })

return M
