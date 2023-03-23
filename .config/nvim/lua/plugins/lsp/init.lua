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
        lua_ls = {
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
        bashls = {
          SHELLCHECK_ARGUMENTS = "-x",
        },
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

        local server_config = {
          capabilities = capabilities,
        }

        if server == "bashls" then
          server_config["cmd_env"] = servers[server]
        else
          server_config["settings"] = servers[server]
        end

        require("lspconfig")[server].setup(server_config)
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
        isort = {},
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
