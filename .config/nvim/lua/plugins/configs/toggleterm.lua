return function(_, opts)
  local toggleterm = require "nvim-autopairs"
  toggleterm.setup(opts)

  local Terminal = require("toggleterm.terminal").Terminal

  local function base_terminal(inner_opts)
    local base_opts = {
      direction = "float",
      float_opts = {
        border = "double",
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd "startinsert!"
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd "startinsert!"
      end,
    }

    if inner_opts then
      for k, v in pairs(inner_opts) do
        base_opts[k] = v
      end
      vim.tbl_deep_extend("force", base_opts, inner_opts or {})
    end

    return Terminal:new(base_opts)
  end

  local lazygit = base_terminal { cmd = "lazygit", dir = "git_dir" }

  ---@diagnostic disable-next-line: lowercase-global
  function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
end
