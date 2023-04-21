return {
  {
    "folke/neodev.nvim", -- lua
    opts = {},
  },
  {
    "simrat39/rust-tools.nvim", -- rust
    config = require "plugins.configs.rust-tools",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        config = require "plugins.configs.mason-lspconfig",
      },
    },
    config = require "plugins.configs.lspconfig",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = { handlers = nil },
        config = require "plugins.configs.mason-null-ls",
      },
    },
    config = require "plugins.configs.null-ls",
  },
}
