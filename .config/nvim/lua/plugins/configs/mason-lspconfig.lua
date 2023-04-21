return function(_, opts)
  local servers = require("wh.util.tools").lsp

  local mason_lspconfig = require "mason-lspconfig"
  mason_lspconfig.setup(require("wh.util").extend_tbl(opts, { ensure_installed = vim.tbl_keys(servers) }))
  mason_lspconfig.setup_handlers {
    function(server)
      local server_opts = servers[server]
      require("wh.util.lsp").setup(server, server_opts)
    end,
  }
end
