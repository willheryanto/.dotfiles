local keymap = vim.keymap.set

-- Split window
keymap("n", "ss", ":split<Return><C-w>w")
keymap("n", "sv", ":vsplit<Return><C-w>w")

-- New tab
keymap("n", "te", ":tabedit")
-- keymap('n', 'tt', ':tabnew<CR>')

-- Switching tabs
local function switchtab_mapper()
  for i = 1, 9, 1 do
    local key = tostring(i)
    keymap("n", "<leader>" .. key, key .. "gt")
  end
end

switchtab_mapper()
