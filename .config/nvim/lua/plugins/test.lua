return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      -- "haydenmeade/neotest-jest",
      "guivazcabral/neotest-jest",
    },
    keys = {
      {
        "<leader>tn",
        function() require("neotest").run.run() end,
        desc = "Run nearest tests",
      },
      {
        "<leader>tf",
        function() require("neotest").run.run(vim.fn.expand("%")) end,
        desc = "Run file tests",
      },
      {
        "<leader>tr",
        function() require("neotest").run.run_last() end,
        desc = "Run last tests",
      },
      {
        "<leader>td",
        function() require("neotest").run.run_last({ strategy = "dap" }) end,
        desc = "Run last tests with dap",
      },
      {
        "<leader>tp",
        function() require("neotest").output_panel.toggle() end,
        desc = "Toggle output panel",
      },
      {
        "<leader>ts",
        function() require("neotest").summary.toggle() end,
        desc = "Toggle summary panel",
      },
      {
        "<leader>to",
        function() require("neotest").output.open({ enter = true }) end,
        desc = "Open output",
      },
      {
        "[t",
        function() require("neotest").jump.prev({ status = "failed" }) end,
        desc = "Jump to previous failed test",
      },
      {
        "]t",
        function() require("neotest").jump.next({ status = "failed" }) end,
        desc = "Jump to next failed test",
      },
      {
        "<leader>T",
        function() require("neotest").run.stop() end,
        desc = "Stop running tests",
      },
    },
    config = require("plugins.configs.neotest"),
  },
}
