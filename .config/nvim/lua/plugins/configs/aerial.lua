local M = {}

M.config = function()
  return {
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  }
end

M.setup = function(_, opts)
  require("aerial").setup(vim.tbl_deep_extend("force", opts, M.config()))
  vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
end

return M
