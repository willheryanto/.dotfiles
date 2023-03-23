return {
  "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-eunuch", -- Sugar for shell commands
  "tpope/vim-surround", -- Bracket editor
  "tpope/vim-abolish", -- Better %s
  "tpope/vim-repeat", -- Supercharged "."
  "tpope/vim-unimpaired", -- Nice to have keybindings
  "windwp/nvim-autopairs", -- Auto close brackets
  "folke/trouble.nvim", -- Diagnostic manager
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
  }, -- Run code snippets"
  {
    "knubie/vim-kitty-navigator",
    build = { "cp ./*.py ~/.config/kitty/" },
  },
}
