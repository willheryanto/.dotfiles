return function(_, opts)
  local lsp = require("wh.utils.lsp")
  local format = require("wh.utils.format")
  local keymap = require("wh.utils.keymap")

  lsp.on_attach(function(client, buf)
    format.on_attach(client, buf)
    keymap.on_attach(client, buf)
  end)
end
