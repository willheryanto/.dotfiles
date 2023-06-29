local keymap = require("wh.utils").keymap

-- Split window
keymap({ "<leader>ss", ":split<Return><C-w>w", desc = "Split window" })
keymap({ "<leader>sv", ":vsplit<Return><C-w>w", desc = "Split window vertical" })

-- New tab
keymap({ "te", ":tabedit ", desc = "New tab" })

-- Switching tabs
local function switchtab_mapper()
  for i = 1, 9, 1 do
    local key = tostring(i)
    keymap({ "<leader>" .. key, key .. "gt", desc = "Go to " .. key })
  end
end

switchtab_mapper()
