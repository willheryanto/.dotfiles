return function(_, opts)
  require("mason-null-ls").setup(
    require("wh.utils").extend_tbl(opts, { ensure_installed = vim.tbl_keys(require("wh.utils.tools").tools) })
  )
end
