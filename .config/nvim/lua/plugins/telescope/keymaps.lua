local Mapper = require "plugins.telescope.mapper"

local M = {}

M._keys = nil

function M.get()
  M._keys = M._keys
    or {
      { "<leader>en", Mapper.pick_telescope "edit_neovim" },
      { "<leader>ez", Mapper.pick_telescope "edit_zsh" },
      { "<leader>et", Mapper.pick_telescope "edit_tmux" },
      { "<leader>fd", Mapper.pick_telescope "find_files" },
      { "<leader>fe", Mapper.pick_telescope "file_browser" },
      { "<leader>fw", Mapper.pick_telescope "file_browser_from_current_buffer" },
      { "<leader>fp", Mapper.pick_telescope "file_browser_project" },
      { "<leader>fz", Mapper.pick_telescope "search_only_certain_files" },
      { "<leader>fg", Mapper.pick_telescope "live_grep" },
    }

  return M._keys
end

function M.on_attach()
  local Keys = require "lazy.core.handler.keys"
  local keymaps = {}

  for _, value in ipairs(M.get()) do
    local keys = Keys.parse(value)
    if keys[2] == vim.NIL or keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has then
      local opts = Keys.opts(keys)
      opts.has = nil
      opts.silent = true
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

return M
