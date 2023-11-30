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
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
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
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
      },
    },
    config = function()
      require("litee.lib").setup()
      require("litee.gh").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    commit = "08d23c7ae1e7c3c66802990d5aa16269bdd996a7",
    opts = {},
  },
}
