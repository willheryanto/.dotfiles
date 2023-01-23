local map_tele = require "wh.telescope.mapper"

-- Dotfile
map_tele("<leader>en", "edit_neovim")
map_tele("<leader>ez", "edit_zsh")
map_tele("<leader>et", "edit_tmux")

-- Diagnostic
map_tele("<space><space>d", "diagnostics")

-- File
map_tele("<space>fd", "find_files")
map_tele("<space>fe", "file_browser")
map_tele("<space>fw", "file_browser_from_current_buffer")
map_tele("<space>fz", "search_only_certain_files")

-- Text
map_tele("<space>fg", "live_grep")
