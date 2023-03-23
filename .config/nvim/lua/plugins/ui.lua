return {
  "nvim-lualine/lualine.nvim", -- Fancier statusline
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
  "akinsho/bufferline.nvim", -- Tabs
  "RRethy/vim-illuminate", -- Automatic highlight for word under cursor
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup {}
    end,
  }, -- TODO highlight
}
