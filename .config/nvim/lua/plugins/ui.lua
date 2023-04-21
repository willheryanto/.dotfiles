return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        theme = "kanagawa",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
    },
  }, -- Fancier statusline
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "┊",
      show_trailing_blankline_indent = false,
      use_treesitter = true,
      show_current_context = true,
    },
  }, -- Add indentation guides even on blank lines
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
    },
  }, -- Tabs
  "RRethy/vim-illuminate", -- Automatic highlight for word under cursor
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup {}
    end,
  }, -- TODO highlight
  {
    "onsails/lspkind-nvim",
    opts = {
      symbol_map = {
        Copilot = "",
      },
    },
    config = require "plugins.configs.lspkind",
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
    -- config = require "plugins.configs.fidget",
  },
}
