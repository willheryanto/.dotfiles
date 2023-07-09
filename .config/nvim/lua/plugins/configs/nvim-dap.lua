local keymap = vim.keymap.set

return function(_, opts)
  local dap = require("dap")
  local dapui = require("dapui")

  local tools = require("wh.utils.tools")

  for k, v in pairs(tools.dap.adapters) do
    dap.adapters[k] = v
  end

  for k, v in pairs(tools.dap.configurations) do
    dap.configurations[k] = v
  end

  keymap("n", "<F5>", dap.continue, { desc = "Continue" })
  keymap("n", "<F17>", dap.terminate, { desc = "Terminate" })
  keymap("n", "<F29>", dap.restart_frame, { desc = "Restart Frame" })
  keymap("n", "<F6>", dap.pause, { desc = "Pause" })
  keymap("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  keymap("n", "<F10>", dap.step_over, { desc = "Step Over" })
  keymap("n", "<F11>", dap.step_into, { desc = "Step Into" })
  keymap("n", "<F23>", dap.step_out, { desc = "Step Out" })
  keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  keymap("n", "<leader>dB", dap.clear_breakpoints, { desc = "Clear Breakpoints" })
  keymap("n", "<leader>dc", dap.continue, { desc = "Continue (F5)" })
  keymap("n", "<leader>di", dap.step_into, { desc = "Step Into (F11)" })
  keymap("n", "<leader>do", dap.step_over, { desc = "Step Over (F10)" })
  keymap("n", "<leader>dO", dap.step_out, { desc = "Step Out (F23)" })
  keymap("n", "<leader>dq", dap.close, { desc = "Close" })
  keymap("n", "<leader>dQ", dap.terminate, { desc = "Terminate (F17)" })
  keymap("n", "<leader>dp", dap.pause, { desc = "Pause (F6)" })
  keymap("n", "<leader>dr", dap.restart_frame, { desc = "Restart Frame (F29)" })
  keymap("n", "<leader>dR", dap.repl.toggle, { desc = "Toggle REPL" })
  keymap("n", "<leader>du", dapui.toggle, { desc = "Toggle UI" })
  keymap("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "Hover" })
end
