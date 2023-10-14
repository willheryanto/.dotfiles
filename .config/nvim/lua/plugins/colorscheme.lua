return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme kanagawa-dragon]]) end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme tokyonight-moon]]) end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() vim.cmd([[colorscheme catppuccin-mocha]]) end,
  },
}
