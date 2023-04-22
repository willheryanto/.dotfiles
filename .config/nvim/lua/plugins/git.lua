return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = vim.fn.executable "git" == 1,
    opts = {},
  },
  {
    "rhysd/git-messenger.vim",
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    keys = {
      { "<leader>go", ":Octo " },
    },
    opts = {},
  },
  {
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
  },
}
