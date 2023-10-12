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
          ensure_installed = { "javascript", "codelldb" },
          automatic_installation = true,
          handlers = {},
        },
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      {
        "rcarriga/nvim-dap-ui",
        opts = { floating = { border = "rounded" } },
        config = require("plugins.configs.nvim-dap-ui"),
      },
      {
        "jbyuki/one-small-step-for-vimkind",
      },
    },
    config = require("plugins.configs.nvim-dap"),
  },
  {
    "leoluz/nvim-dap-go",
    config = function() require("dap-go").setup() end,
  },
}
