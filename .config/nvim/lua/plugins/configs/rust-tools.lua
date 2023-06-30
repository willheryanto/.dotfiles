return function(_, opts)
  local rt = require("rust-tools")

  rt.setup(opts)
  rt.inlay_hints.enable()
end
