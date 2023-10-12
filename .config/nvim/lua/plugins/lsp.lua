return {
  {
    "folke/neodev.nvim", -- lua
    priority = 1,
    opts = {},
  },
  {
    "simrat39/rust-tools.nvim", -- rust
    opts = {
      tools = {
        inlay_hints = {
          auto = true,
        },
      },
    },
    config = require("plugins.configs.rust-tools"),
  },
  -- {
  --   "pmizio/typescript-tools.nvim", -- typescript
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
    },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    opts = {
      lsp_cfg = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        config = require("plugins.configs.mason-lspconfig"),
      },
    },
    config = require("plugins.configs.lspconfig"),
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = { handlers = nil },
        config = require("plugins.configs.mason-null-ls"),
      },
    },
    config = require("plugins.configs.null-ls"),
  },
  -- {
  --   "ray-x/navigator.lua",
  --   dependencies = {
  --     { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  --     { "neovim/nvim-lspconfig" },
  --   },
  --   opts = {},
  --   config = require("plugins.configs.navigator"),
  -- },
}
