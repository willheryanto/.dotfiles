return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "folke/neodev.nvim", -- lua
      "simrat39/rust-tools.nvim", -- rust
      "hrsh7th/cmp-nvim-lsp",
      "smjonas/inc-rename.nvim",
    },
    config = function()
      require("neodev").setup()
      require("inc_rename").setup()

      require("wh.util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      local servers = {
        sumneko_lua = {
          custom_name = "lua_ls",
          Lua = {
            diagnostics = {
              globals = {
                "vim",
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
        tsserver = {},
        bashls = {},
        gopls = {},
        texlab = {},
        pyright = {},
        astro = {},
        cssls = {},
        cssmodules_ls = {},
        tailwindcss = {},
        rust_analyzer = {
          disabled = true,
        },
        vimls = {},
        marksman = {},
        sqlls = {},
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local setup = function(server)
        if server["disabled"] then
          return
        end

        local current_settings = servers[server]

        local server_name = nil
        if current_settings["custom_name"] then
          server_name = current_settings["custom_name"]
        else
          server_name = server
        end

        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          settings = servers[server],
        }
      end

      require("mason").setup()

      require("mason-lspconfig").setup { ensure_installed = vim.tbl_keys(servers) }
      require("mason-lspconfig").setup_handlers { setup }

      require("plugins.lsp.rust").setup()
    end,
  },

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local formatters = {
        stylua = {},
        shfmt = {},
        black = {},
        prettier = {},
      }

      require("mason-tool-installer").setup {
        ensure_installed = vim.tbl_keys(formatters),
      }

      local FORMATTING = "formatting"
      local DIAGNOSTICS = "diagnostics"

      local build_null_source = function(tool, config, null_type)
        if not config then
          return
        end

        if null_type ~= FORMATTING and null_type ~= DIAGNOSTICS then
          return
        end

        if type(config) ~= "table" then
          config = {}
        end

        return require("null-ls").builtins[null_type][tool].with(config)
      end

      local null_sources = {
        require("null-ls").builtins.formatting.sql_formatter,
      }

      for formatter, config in pairs(formatters) do
        local source = build_null_source(formatter, config, FORMATTING)
        table.insert(null_sources, source)
      end

      require("null-ls").setup {
        sources = null_sources,
      }
    end,
  },
}
