return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        cmd = {
          "DapInstall",
          "DapUninstall",
        },
        opts = {
          ensure_installed = { "javascript" },
          automatic_installation = true,
          handlers = {},
        },
      },
      {
        "rcarriga/nvim-dap-ui",
        opts = { floating = { border = "rounded" } },
        config = require "plugins.configs.nvim-dap-ui",
      },
    },
    config = require "plugins.configs.nvim-dap",
  },
}
