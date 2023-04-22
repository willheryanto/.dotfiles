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
    "akinsho/bufferline.nvim",
    lazy = false,
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
  {
    "yamatsum/nvim-web-nonicons",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(msg, level, opts)
        -- log.info(msg, level, opts)
        if string.find(msg, "method .* is not supported") then
          return
        end

        require "notify"(msg, level, opts)
      end
    end,
  },
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
    "folke/todo-comments.nvim",
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
  },
  "RRethy/vim-illuminate", -- Automatic highlight for word under cursor
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    end,
  },
}
