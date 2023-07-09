vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1

vim.g.vimtex_compiler_latexmk = {
  out_dir = "dist",
}

vim.g.vimtex_quickfix_ignore_filters = {
  "Underfull",
  "Overfull",
}

vim.cmd([[
augroup WrapLineInTeXFile
    autocmd FileType tex setlocal wrap
augroup END
]])
