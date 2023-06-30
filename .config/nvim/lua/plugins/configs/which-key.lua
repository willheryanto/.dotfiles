local M = {}

M.setup = function(_, opts)
  local wk = require("which-key")
  wk.setup(opts)

  local maps_all = {
    c = {
      name = "Code",
    },
    r = {
      name = "Refactor",
    },
    h = {
      name = "Hunk",
    },
  }

  local maps_normal = {
    e = {
      name = "Edit",
    },
    f = {
      name = "Find",
    },
    g = {
      name = "Git",
    },
    s = {
      name = "Split",
    },
    t = {
      name = "Test",
    },
    p = {
      name = "Plugins Manager",
      i = {
        function()
          require("lazy").install()
        end,
        "Plugins Install",
      },
      s = {
        function()
          require("lazy").home()
        end,
        "Plugins Status",
      },
      S = {
        function()
          require("lazy").sync()
        end,
        "Plugins Sync",
      },
      u = {
        function()
          require("lazy").check()
        end,
        "Plugins Check Updates",
      },
      U = {
        function()
          require("lazy").update()
        end,
        "Plugins Update",
      },
    },
  }

  wk.register(vim.tbl_deep_extend("force", maps_normal, maps_all), { prefix = "<leader>" })
  wk.register(maps_all, { mode = "v", prefix = "<leader>" })
end

return M
