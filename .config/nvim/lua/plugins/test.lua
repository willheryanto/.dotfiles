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
      },
      {
        "<leader>rf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
      },
      {
        "<leader>rr",
        function()
          require("neotest").run.run_last()
        end,
      },
      {
        "<leader>rd",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
      },
      {
        "<leader>rp",
        function()
          require("neotest").output_panel.toggle()
        end,
      },
      {
        "<leader>rs",
        function()
          require("neotest").summary.toggle()
        end,
      },
      {
        "<leader>ro",
        function()
          require("neotest").output.open({ enter = true })
        end,
      },
      {
        "[t",
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
      },
      {
        "]t",
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
      },
      {
        "<leader>R",
        function()
          require("neotest").run.stop()
        end,
      },
    },
    config = require("plugins.configs.neotest"),
  },
}
