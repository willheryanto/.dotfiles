return {
  {
    "knubie/vim-kitty-navigator",
    build = { "cp ./*.py ~/.config/kitty/" },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    opt = {},
    config = function(_, opts)
      require("refactoring").setup(opts)

      -- Remaps for the refactoring operations currently offered by the plugin
      vim.api.nvim_set_keymap(
        "v",
        "<leader>rf",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
        { noremap = true, silent = true, expr = false, desc = "Extract Function" }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>rv",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
        { noremap = true, silent = true, expr = false, desc = "Extract Variable" }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>ri",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        { noremap = true, silent = true, expr = false, desc = "Inline Variable" }
      )

      -- Extract block doesn't need visual mode
      vim.api.nvim_set_keymap(
        "n",
        "<leader>rb",
        [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
        { noremap = true, silent = true, expr = false, desc = "Extract Block" }
      )

      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ri",
        [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        { noremap = true, silent = true, expr = false, desc = "Inline Variable" }
      )
    end,
  },
}
