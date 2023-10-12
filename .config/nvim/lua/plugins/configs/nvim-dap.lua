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

  -- TODO: remove this
  -- a nil path defaults to .vscode/launch.json
  -- require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } })

  keymap("n", "<F5>", dap.continue, { desc = "Continue" })
  keymap("n", "<F17>", dap.terminate, { desc = "Terminate" })
  keymap("n", "<F29>", dap.restart_frame, { desc = "Restart Frame" })
  keymap("n", "<F6>", dap.pause, { desc = "Pause" })
  keymap("n", "<F7>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  keymap("n", "<F8>", dap.step_over, { desc = "Step Over" })
  keymap("n", "<F9>", dap.step_into, { desc = "Step Into" })
  keymap("n", "<F10>", dap.step_out, { desc = "Step Out" })
  keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  keymap("n", "<leader>dB", dap.clear_breakpoints, { desc = "Clear Breakpoints" })
  keymap("n", "<leader>dc", dap.continue, { desc = "Continue (F5)" })
  keymap("n", "<leader>di", dap.step_into, { desc = "Step Into (F9)" })
  keymap("n", "<leader>do", dap.step_over, { desc = "Step Over (F8)" })
  keymap("n", "<leader>dO", dap.step_out, { desc = "Step Out (F10)" })
  keymap("n", "<leader>dq", dap.close, { desc = "Close" })
  keymap("n", "<leader>dQ", dap.terminate, { desc = "Terminate (F17)" })
  keymap("n", "<leader>dp", dap.pause, { desc = "Pause (F6)" })
  keymap("n", "<leader>dr", dap.restart_frame, { desc = "Restart Frame (F29)" })
  keymap("n", "<leader>dR", dap.repl.toggle, { desc = "Toggle REPL" })
  keymap("n", "<leader>du", dapui.toggle, { desc = "Toggle UI" })
  keymap("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "Hover" })

  vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
  vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
  vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

  vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
  )
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
end
