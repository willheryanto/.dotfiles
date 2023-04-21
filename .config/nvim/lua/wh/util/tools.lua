local M = {}

local FORMATTING = "formatting"
local DIAGNOSTICS = "diagnostics"

M.lsp = {
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
  vimls = {},
  marksman = {},
  sqlls = {},
  terraformls = {},
  eslint = {},
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
          return utils.has_file { ".prettierrc.js" }
        end,
      },
    },
  },
  -- eslint_d = {
  --   {
  --     type = FORMATTING,
  --     settings = {
  --       condition = function(utils)
  --         return utils.has_file { ".eslintrc.js" }
  --       end,
  --     },
  --   },
  --   {
  --     type = DIAGNOSTICS,
  --     settings = {
  --       condition = function(utils)
  --         return utils.has_file { ".eslintrc.js" }
  --       end,
  --     },
  --   },
  -- },
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
