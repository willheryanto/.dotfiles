return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = true,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-CR>",
          next = "<C-k>",
          prev = "<C-j>",
        },
      },
      filetypes = {
        ["*"] = function()
          local ok, n = pcall(vim.fn.getfsize, vim.fn.expand("%"))
          return ok and n < 50000
        end,
      },
    },
    config = require("plugins.configs.copilot"),
  },
}
