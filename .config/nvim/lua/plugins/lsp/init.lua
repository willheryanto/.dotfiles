return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
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
        tsserver = {},
        bashls = {
          SHELLCHECK_ARGUMENTS = "-x",
        },
        gopls = {},
        texlab = {},
        pyright = {},
        -- pylsp = {
        --   pylsp = {
        --     plugins = {
        --       ruff = { enabled = false },
        --       autopep8 = { enabled = false },
        --       flake8 = { enabled = false },
        --       mccabe = { enabled = false },
        --       pycodestyle = { enabled = false },
        --       pydocstyle = { enabled = false },
        --       pyflakes = { enabled = false },
        --       pylint = { enabled = false },
        --       yapf = { enabled = false },
        --     },
        --   },
        -- },
        ruff_lsp = {},
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
        terraformls = {},
        eslint = {},
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
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local formatters = {
        stylua = {},
        shfmt = {},
        -- isort = {},
        -- black = {},
        ruff = {},
        prettier = {
          condition = function(utils)
            return utils.has_file { ".prettierrc.js" }
          end,
        },
        eslint_d = {
          condition = function(utils)
            return utils.has_file { ".eslintrc.js" }
          end,
        },
        sql_formatter = {
          alias = "sql-formatter",
        },
      }

      local linters = {
        -- eslint_d = {
        --   condition = function(utils)
        --     return utils.has_file { ".eslintrc.js" }
        --   end,
        -- },
        -- mypy = {}
      }

      local build_tools = function(tool_formatters, tool_linters)
        local tools = {}

        for k, v in pairs(tool_formatters) do
          if tools[k] == nil then
            if v["alias"] then
              tools[v["alias"]] = v
            else
              tools[k] = v
            end
          end
        end

        for k, v in pairs(tool_linters) do
          if tools[k] == nil then
            if v["alias"] then
              tools[v["alias"]] = v
            else
              tools[k] = v
            end
          end
        end

        return tools
      end

      require("mason-null-ls").setup {
        -- ensure_installed = vim.tbl_keys(formatters),
        ensure_installed = vim.tbl_keys(build_tools(formatters, linters)),
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
        -- require("null-ls").builtins.formatting.sql_formatter,
        -- require("null-ls").builtins.diagnostics.eslint_d,
      }

      for formatter, config in pairs(formatters) do
        local source = build_null_source(formatter, config, FORMATTING)
        table.insert(null_sources, source)
      end

      for linter, config in pairs(linters) do
        local source = build_null_source(linter, config, DIAGNOSTICS)
        table.insert(null_sources, source)
      end

      require("null-ls").setup {
        sources = null_sources,
      }
    end,
  },
}
