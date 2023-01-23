return {
  "lewis6991/gitsigns.nvim",
  "rhysd/git-messenger.vim",
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
}
