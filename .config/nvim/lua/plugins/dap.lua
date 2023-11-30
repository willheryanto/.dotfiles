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
          ensure_installed = { "javascript", "python" },
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
      {
        "mxsdev/nvim-dap-vscode-js",
      },
      {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
    },
    config = require("plugins.configs.nvim-dap"),
  },
  {
    "leoluz/nvim-dap-go",
    main = "dap-go",
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    config = function() require("dap-python").setup(os.getenv("HOME") .. "/.asdf/shims/python", {}) end,
  },
}
