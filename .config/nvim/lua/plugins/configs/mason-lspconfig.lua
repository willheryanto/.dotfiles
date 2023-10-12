return function(_, opts)
  local servers = require("wh.utils.tools").mason_lsp

  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup(require("wh.utils").extend_tbl(opts, { ensure_installed = vim.tbl_keys(servers) }))
  mason_lspconfig.setup_handlers({
    function(server)
      local server_opts = servers[server]
      if not server_opts then return end
      require("wh.utils.lsp").setup(server, server_opts)
    end,
  })
end
