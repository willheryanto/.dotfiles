local M = {}

M.setup = function()
  require("rust-tools").setup()
  require("rust-tools").inlay_hints.enable()
end

return M
