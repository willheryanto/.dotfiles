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
    config = require("plugins.configs.nvim-autopairs"),
  },
  -- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-eunuch", -- Sugar for shell commands
  "tpope/vim-surround", -- Bracket editor
  "tpope/vim-abolish", -- Better %s
  -- "tpope/vim-repeat", -- Supercharged "."
  "tpope/vim-unimpaired", -- Nice to have keybindings
  {
    "akinsho/toggleterm.nvim",
    config = require("plugins.configs.toggleterm"),
  },
  {
    "ggandor/leap.nvim",
    config = require("plugins.configs.leap"),
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  --   keys = {
  --     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --     { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  --   },
  -- },
  {
    "jinh0/eyeliner.nvim",
    opts = {},
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = true,
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    config = require("plugins.configs.ufo"),
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    config = require("plugins.configs.aerial").setup,
  },
  { "Vimjas/vim-python-pep8-indent" },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      dap_enabled = true,
    },
  },
}
