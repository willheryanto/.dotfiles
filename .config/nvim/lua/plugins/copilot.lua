return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    keys = {
      {
        "<leader>co",
        ":Copilot",
        desc = "Run Copilot",
      },
      {
        "<leader>cp",
        "<CMD>Copilot panel<CR>",
        desc = "Toggle Copilot panel",
      },
    },
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true,
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
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    commit = "24bcca7",
    config = function() require("chatgpt").setup() end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
