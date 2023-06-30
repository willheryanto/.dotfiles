local M = {}

local setup_handler = function(server, opts) require("lspconfig")[server].setup(opts) end

-- Default capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

function M.config(server_name, opts)
  local server = require("lspconfig")[server_name]
  local lsp_opts = require("wh.utils").extend_tbl(
    { capabilities = server.capabilities },
    { capabilities = M.capabilities }
  )

  local settings_key = "settings"

  if server_name == "bash_ls" then settings_key = "cmd_env" end

  if server_name == "lua_ls" then -- by default initialize neodev and disable third party checking
    pcall(require, "neodev")
  end

  return require("wh.utils").extend_tbl(lsp_opts, { [settings_key] = opts })
end

function M.setup(server, opts)
  local server_opts = M.config(server, opts) or {}
  setup_handler(server, server_opts)
end

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      client.server_capabilities.semanticTokensProvider = nil

      if client.name == "ruff_lsp" then client.server_capabilities.hoverProvider = false end

      on_attach(client, buffer)
    end,
  })
end

return M
