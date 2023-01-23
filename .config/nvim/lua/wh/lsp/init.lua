local has_neodev, neodev = pcall(require, "neodev")
if not has_neodev then
  return
end

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

local tableconcat = function(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

-- Enable the following language servers
local servers = {
  sumneko_lua = {
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
  bashls = {},
  gopls = {},
  texlab = {},
  -- clangd = {},
  -- pyright = {},
  -- rust_analyzer = {},
}
local formatters = {
  stylua = {},
  shfmt = {},
}

local linters = {}

-- Setup neovim lua configuration
neodev.setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

if not pcall(require, "lspconfig") then
  return
end

-- Setup mason so it can manage external tooling
require("mason").setup()

local mason_lspconfig = require "mason-lspconfig"
require("mason-lspconfig").setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

local has_null, null = pcall(require, "null-ls")
if not has_null then
  return
end

local mason_tool_installer = require "mason-tool-installer"

local tools = {}

tableconcat(tools, formatters)
tableconcat(tools, linters)

mason_tool_installer.setup {
  ensure_installed = vim.tbl_keys(tools),
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

  return null.builtins[null_type][tool].with(config)
end

local null_sources = {}

for formatter, config in pairs(formatters) do
  local source = build_null_source(formatter, config, FORMATTING)
  table.insert(null_sources, source)
end

for linter, config in pairs(linters) do
  local source = build_null_source(linter, config, DIAGNOSTICS)
  table.insert(null_sources, source)
end

null.setup {
  sources = null_sources,
}

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
