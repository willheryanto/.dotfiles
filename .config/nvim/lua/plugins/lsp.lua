return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "j-hui/fidget.nvim",

      "folke/neodev.nvim",
    },
    config = function()
      require "wh.lsp"
    end,
  },
  -- {
  --   'glepnir/lspsaga.nvim',
  --   event = 'BufRead',
  --   config = function()
  --     require('lspsaga').setup({})
  --   end
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
}
