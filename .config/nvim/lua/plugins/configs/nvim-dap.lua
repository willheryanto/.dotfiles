local keymap = vim.keymap.set

return function(_, opts)
  local dap = require "dap"
  local dapui = require "dapui"

  dap.adapters["pwa-node"] = {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "node",
      args = { vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
    },
  }

  dap.configurations.javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  }

  dap.configurations.typescript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "ts-node",
      -- sourceMaps = true,
      -- console = "integratedTerminal",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
  }

  keymap("n", "<F5>", dap.continue)
  keymap("n", "<F17>", dap.terminate)
  keymap("n", "<F29>", dap.restart_frame)
  keymap("n", "<F6>", dap.pause)
  keymap("n", "<F9>", dap.toggle_breakpoint)
  keymap("n", "<F10>", dap.step_over)
  keymap("n", "<F11>", dap.step_into)
  keymap("n", "<F23>", dap.step_out)
  keymap("n", "<leader>db", dap.toggle_breakpoint)
  keymap("n", "<leader>dB", dap.clear_breakpoints)
  keymap("n", "<leader>dc", dap.continue)
  keymap("n", "<leader>di", dap.step_into)
  keymap("n", "<leader>do", dap.step_over)
  keymap("n", "<leader>dO", dap.step_out)
  keymap("n", "<leader>dq", dap.close)
  keymap("n", "<leader>dQ", dap.terminate)
  keymap("n", "<leader>dp", dap.pause)
  keymap("n", "<leader>dr", dap.restart_frame)
  keymap("n", "<leader>dR", dap.repl.toggle)
  keymap("n", "<leader>du", dapui.toggle)
  keymap("n", "<leader>dh", require("dap.ui.widgets").hover)
end
