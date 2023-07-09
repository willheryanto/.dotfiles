return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = vim.fn.executable("git") == 1,
    opts = {},
    config = require("plugins.configs.gitsigns"),
  },
  {
    "rhysd/git-messenger.vim",
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>vo",
        ":DiffviewOpen<CR>",
        desc = "Open diffview",
      },
      {
        "<leader>vc",
        ":DiffviewClose<CR> ",
        desc = "Close diffview",
      },
      {
        "<leader>vh",
        ":DiffviewFileHistory %<CR> ",
        desc = "Open diffview of current file history",
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
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
