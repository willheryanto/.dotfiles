-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "man",
    "notify",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

local i = 0

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    "*.py",
  },
  callback = function()
    local pyfile = vim.api.nvim_buf_get_name(0)
    local ipynbfile = pyfile:gsub(".py$", ".ipynb")

    local f = io.open(ipynbfile, "r")
    if f ~= nil then
      io.close(f)
      vim.cmd("silent !jupytext --sync " .. pyfile)
    end
  end,
})
