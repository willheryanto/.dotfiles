return {
  {
    "nvim-telescope/telescope.nvim",
    priority = 100,
    branch = "0.1.x",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "AckslD/nvim-neoclip.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = require("plugins.configs.telescope").setup,
  },
}
