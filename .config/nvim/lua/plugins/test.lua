return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    keys = {
      {
        "<leader>rn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run all tests",
      },
      {
        "<leader>rf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run file tests",
      },
      {
        "<leader>rr",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last tests",
      },
      {
        "<leader>rd",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Run last tests with dap",
      },
      {
        "<leader>rp",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle output panel",
      },
      {
        "<leader>rs",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle summary panel",
      },
      {
        "<leader>ro",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Open output",
      },
      {
        "[t",
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
        desc = "Jump to previous failed test",
      },
      {
        "]t",
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
        desc = "Jump to next failed test",
      },
      {
        "<leader>R",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop running tests",
      },
    },
    config = require("plugins.configs.neotest"),
  },
}
