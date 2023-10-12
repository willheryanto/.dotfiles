return function(_, opts)
  vim.o.foldcolumn = "1" -- '0' is not bad
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = -1
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

  vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
  vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
  vim.keymap.set("n", "zk", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then vim.lsp.buf.hover() end
  end)

  require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype) return { "treesitter", "indent" } end,
  })
end
