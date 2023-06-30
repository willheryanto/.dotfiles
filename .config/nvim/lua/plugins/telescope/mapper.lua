local custom_telescope = require("plugins.telescope.custom")

local M = {}

function M.pick_telescope(key, opts)
  opts = opts or {}
  return function()
    if custom_telescope[key] then
      return custom_telescope[key](opts)
    else
      return require("telescope.builtin")[key](opts)
    end
  end
end

return M
