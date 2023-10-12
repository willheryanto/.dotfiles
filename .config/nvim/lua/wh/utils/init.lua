
local M = {}

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

function M.has(plugin) return require("lazy.core.config").plugins[plugin] ~= nil end

function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then return {} end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

local Keys = require("lazy.core.handler.keys")

---Abstracting keymap
---@param value table
function M.keymap(value)
  local keys = Keys.parse(value)

  if keys[2] == vim.NIL or keys[2] == false then return end

  local opts = Keys.opts(keys)
  vim.keymap.set(keys.mode or "n", keys["lhs"], keys["rhs"], opts)
end

return M
