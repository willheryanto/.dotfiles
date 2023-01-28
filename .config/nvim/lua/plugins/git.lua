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
    keys = {
      { "<leader>go", ":Octo " },
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
  },
}
