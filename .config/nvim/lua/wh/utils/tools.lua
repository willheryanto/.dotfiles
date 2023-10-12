local M = {}

local FORMATTING = "formatting"
local DIAGNOSTICS = "diagnostics"

M.mason_lsp = {
  tsserver = {},
  bashls = {
    cmd_env = {
      SHELLCHECK_ARGUMENTS = "-x",
    },
  },
  gopls = {},
  texlab = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "error",
            reportUndefinedVariable = "none",
          },
        },
      },
    },
  },
  ruff_lsp = {},
  astro = {},
  cssls = {},
  cssmodules_ls = {},
  tailwindcss = {},
  vimls = {},
  marksman = {},
  sqlls = {},
  terraformls = {},
  eslint = {},
  spectral = {},
  prismals = {},
  solargraph = {
    -- cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", "stdio" },
    root_dir = { ".git" },
    settings = {
      solargraph = {
        diagnostic = false,
      },
    },
  },
  lua_ls = {},
  clangd = {},
}

M.lsp = {
  sourcekit = {},
}

M.tools = {
  stylua = {
    {
      type = FORMATTING,
      settings = {},
    },
  },
  shfmt = {
    {
      type = FORMATTING,
      settings = {},
    },
  },
  ruff = {
    {
      type = FORMATTING,
      settings = {},
    },
    {
      type = DIAGNOSTICS,
      settings = {},
    },
  },
  prettier = {
    {
      type = FORMATTING,
      settings = {
        condition = function(utils)
          return utils.has_file({ ".prettierrc.js" }) or not utils.has_file({ ".eslintrc.js" })
        end,
      },
    },
  },
  sqlfmt = {
    {
      type = FORMATTING,
      settings = {},
    },
  },
  prismaFmt = {
    {
      type = FORMATTING,
      settings = {},
    },
  },
  hadolint = {
    {
      type = DIAGNOSTICS,
      settings = {},
    },
  },
  cpplint = {
    {
      type = DIAGNOSTICS,
      settings = {},
    },
  },
}

M.dap = {}

M.dap.adapters = {
  ["pwa-node"] = {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
    },
  },

  nlua = function(callback, config)
    callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
  end,

  -- codelldb = {
  --   type = "server",
  --   host = "127.0.0.1",
  --   port = "${port}",
  --   executable = {
  --     command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
  --     args = { "--port", "${port}" },
  --   },
  -- },
}

local dap_default_js = {
  type = "pwa-node",
  request = "launch",
  name = "Launch file",
  program = "${file}",
  cwd = "${workspaceFolder}",
}

M.dap.configurations = {
  javascript = {
    dap_default_js,
  },

  typescript = {
    require("wh.utils").extend_tbl(dap_default_js, {
      runtimeExecutable = "mtn",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "**/@xendit/**/*.js",
        "!**/node_modules/**",
      },
    }),
  },

  lua = {
    {
      type = "nlua",
      request = "attach",
      name = "Attach to running Neovim instance",
    },
  },
}

function M.iterate_tools(callback)
  for tool, configs in pairs(M.tools) do
    for i = 1, #configs do
      local cur = configs[i]
      callback(tool, cur["type"], cur["settings"])
    end
  end
end

return M
