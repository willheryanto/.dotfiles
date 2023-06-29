M = {}

M.config = {
  open_mapping = [[<c-\>]],
  insert_mappings = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

return function(_, opts)
  local toggleterm = require("nvim-autopairs")
  local utils = require("wh.utils")
  opts = utils.extend_tbl(M.config, opts)
  toggleterm.setup(opts)

  _lazygit_toggle = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
      },
      on_open = function(_)
        vim.cmd("startinsert!")
      end,
      on_close = function(_) end,
      count = 99,
    })
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true, desc = "Layzgit" })
end
