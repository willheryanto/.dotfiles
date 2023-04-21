return function(_, opts)
  local lsp = require "wh.util.lsp"
  local format = require "wh.util.format"
  local keymap = require "wh.util.keymap"

  lsp.on_attach(function(client, buf)
    format.on_attach(client, buf)
    keymap.on_attach(client, buf)
  end)
end
