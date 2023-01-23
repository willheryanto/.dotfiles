return {
  {
    "nvim-telescope/telescope.nvim",
    priority = 100,
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "wh.telescope.setup"
      require "wh.telescope.keymaps"
    end,
  },

  "nvim-telescope/telescope-file-browser.nvim",
}
