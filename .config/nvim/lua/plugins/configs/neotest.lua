return function(_, opts)
  local utils = require("wh.utils")

  local adapters = {
    adapters = {
      utils.has("neotest-jest") and require("neotest-jest")({
        jestCommand = "npm run test:single --",
        jestConfigFile = "jest.config.js",
        env = { CI = true },
        cwd = function(path) return vim.fn.getcwd() end,
      }),
    },
  }

  local conf = utils.extend_tbl(opts, adapters)
  require("neotest").setup(conf)
end
