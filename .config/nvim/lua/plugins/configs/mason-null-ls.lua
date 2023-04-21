return function(_, opts)
  require("mason-null-ls").setup(
    require("wh.util").extend_tbl(opts, { ensure_installed = vim.tbl_keys(require("wh.util.tools").tools) })
  )
end
