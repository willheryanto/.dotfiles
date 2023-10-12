return function(_, opts)
  local rt = require("rust-tools")
  local utils = require("wh.utils")

  rt.setup(utils.extend_tbl(opts, {
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(
        vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
        vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb"
      ),
    },
  }))
end
