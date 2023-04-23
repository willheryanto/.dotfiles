return {
  "nvim-lua/plenary.nvim",
  {
    "numToStr/Comment.nvim",
    opts = function()
      local has_cs, cs = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return has_cs and cs and { pre_hook = cs.create_pre_hook() } or {}
    end,
  }, -- "gc" to comment visual regions/lines
  {
    "windwp/nvim-autopairs",
    opts = {
      check_ts = true,
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = require "plugins.configs.nvim-autopairs",
  },
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-eunuch", -- Sugar for shell commands
  "tpope/vim-surround", -- Bracket editor
  "tpope/vim-abolish", -- Better %s
  "tpope/vim-repeat", -- Supercharged "."
  "tpope/vim-unimpaired", -- Nice to have keybindings
  {
    "akinsho/toggleterm.nvim",
    config = require "plugins.configs.toggleterm",
  },
  {
    "ggandor/leap.nvim",
    config = require "plugins.configs.leap",
  },
}
