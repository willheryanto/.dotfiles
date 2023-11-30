local keymap = vim.keymap.set

return function(_, opts)
  local dap = require("dap")
  local dapui = require("dapui")

  local tools = require("wh.utils.tools")

  -- require("dap-vscode-js").setup({
  --   debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
  --   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
  -- })
  --
  -- for _, language in ipairs({ "typescript", "javascript" }) do
  --   tools.dap.configurations[language] = {
  --     -- attach to a node process that has been started with
  --     -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
  --     -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
  --     {
  --       -- use nvim-dap-vscode-js's pwa-node debug adapter
  --       type = "pwa-node",
  --       -- attach to an already running node process with --inspect flag
  --       -- default port: 9222
  --       request = "attach",
  --       -- allows us to pick the process using a picker
  --       processId = require("dap.utils").pick_process,
  --       -- name of the debug action you have to select for this config
  --       name = "Attach debugger to existing `node --inspect` process",
  --       -- for compiled languages like TypeScript or Svelte.js
  --       sourceMaps = true,
  --       -- resolve source maps in nested locations while ignoring node_modules
  --       resolveSourceMapLocations = {
  --         "${workspaceFolder}/**",
  --         "!**/node_modules/**",
  --       },
  --       -- path to src in vite based projects (and most other projects as well)
  --       cwd = "${workspaceFolder}/src",
  --       -- we don't want to debug code inside node_modules, so skip it!
  --       skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
  --     },
  --     {
  --       type = "pwa-chrome",
  --       name = "Launch Chrome to debug client",
  --       request = "launch",
  --       url = "http://localhost:5173",
  --       sourceMaps = true,
  --       protocol = "inspector",
  --       port = 9222,
  --       webRoot = "${workspaceFolder}/src",
  --       -- skip files from vite's hmr
  --       skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
  --     },
  --     -- only if language is javascript, offer this debug action
  --     language == "javascript"
  --         and {
  --           -- use nvim-dap-vscode-js's pwa-node debug adapter
  --           type = "pwa-node",
  --           -- launch a new process to attach the debugger to
  --           request = "launch",
  --           -- name of the debug action you have to select for this config
  --           name = "Launch file in new node process",
  --           -- launch current file
  --           program = "${file}",
  --           cwd = "${workspaceFolder}",
  --         }
  --       or nil,
  --   }
  -- end

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

  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({ reset = true }) end
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close
end
