return function(_, opts)
  local nls = require("null-ls")
  local tools = require("wh.utils.tools")

  local sources = {}

  local has_gitsigns, _ = pcall(require, "gitsigns")
  if has_gitsigns then
    table.insert(sources, nls.builtins.code_actions.gitsigns)
  end

  local build_nls_source = function(tool, type, config)
    return nls.builtins[type][tool].with(config)
  end

  local callback = function(tool, type, config)
    table.insert(sources, build_nls_source(tool, type, config))
  end

  tools.iterate_tools(callback)

  nls.setup(require("wh.utils").extend_tbl(opts, {
    sources = sources,
  }))
end
