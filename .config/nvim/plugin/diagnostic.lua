vim.diagnostic.config({
  underline = true,
  virtual_text = {
    severity = nil,
    source = "if_many",
    format = nil,
  },
  -- virtual_text = floating,
  -- virtual_lines = not floating,
  signs = true,

  -- options for floating windows:
  float = {
    show_header = true,
    -- border = "rounded",
    -- source = "always",
    format = function(d)
      if not d.code and not d.user_data then return d.message end

      local t = vim.deepcopy(d)
      local code = d.code
      if not code then
        if not d.user_data.lsp then return d.message end

        code = d.user_data.lsp.code
      end
      if code then t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "") end
      return t.message
    end,
  },

  -- general purpose
  severity_sort = true,
  update_in_insert = false,
})

-- vim.api.nvim_create_autocmd("WinEnter", {
--   callback = function()
--     local floating = vim.api.nvim_win_get_config(0).relative ~= ""
--     vim.diagnostic.config({
--       virtual_text = floating,
--       virtual_lines = not floating,
--     })
--   end,
-- })
