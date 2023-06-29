return {
  {
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = require("plugins.configs.luasnip"),
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local has_lspkind, lspkind = pcall(require, "lspkind")
      local has_luasnip, luasnip = pcall(require, "luasnip")
      local has_dbc = require("wh.utils").has("vim-dadbod-completion")

      if not has_luasnip then
        return
      end

      local sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }

      if has_dbc then
        table.insert(sources, { name = "vim-dadbod-completion" })
      end

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<C-e>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif require("copilot.suggestion").is_visible() then
              require("copilot.suggestion").accept()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            elseif require("copilot.suggestion").is_visible() then
              require("copilot.suggestion").prev()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = sources,
        {
          { name = "path" },
          { name = "buffer", keyword_length = 5 },
        },
        formatting = {
          format = has_lspkind and lspkind.cmp_format({
            -- with_text = true,
            -- menu = {
            --   buffer = "[buf]",
            --   nvim_lsp = "[LSP]",
            --   nvim_lua = "[api]",
            --   path = "[path]",
            --   luasnip = "[snip]",
            -- },
            mode = "symbol",
            max_width = 50,
            ellipsis_char = "...",
          }),
        },
        view = {
          entries = {
            native = true,
          },
        },
        experimental = {
          ghost_text = true,
        },
      }
    end,
  },
}
