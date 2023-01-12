local lspkind_icons = require 'core.lspkind_icons'
-- TODO reaudit https://github.com/ms-jpq/coq_nvim and seee if it works as good or better
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  init = function()
    vim.opt.completeopt = "menuone,noselect"
  end,
  dependencies = {
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "ray-x/cmp-treesitter",
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require('luasnip')

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      formatting = {
        format = function(entry, vim_item)
          if vim.tbl_contains({ 'path' }, entry.source.name) then
            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            if icon then
              vim_item.kind = icon
              vim_item.kind_hl_group = hl_group
              return vim_item
            end
          end

          -- Kind icons
          -- This concatonates the icons with the name of the item kind
          vim_item.kind = string.format('%s %s', lspkind_icons[vim_item.kind], vim_item.kind)
          -- Source
          vim_item.menu = ({
            buffer = "[Buffer]",
            treesitter = "[TS]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            nvim_lua = "[VIM]",
          })[entry.source.name]
          return vim_item
        end
      },
      mapping = cmp.mapping.preset.insert {
        ['<PageUp>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<PageDown>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({
              select = true,
              behavior = cmp.ConfirmBehavior.Replace
            })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'treesitter' },
      }, {
        { name = 'buffer' },
      }),
      sorting = {
        comparators = {
          function(...) return require('cmp_buffer'):compare_locality(...) end,
        }
      },
    }

    -- Set configuration for specific sql using dadbod.
    -- cmp.setup.filetype('sql', {
    --   sources = cmp.config.sources {
    --     { name = 'vim-dadbod-completion' },
    --   }
    -- })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline({
        -- Your configuration here.
      }),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({
        -- Your configuration here.
      }),
      sources = cmp.config.sources({
        { name = 'cmdline' }
      }, {
        { name = 'path' }
      })
    })
  end,
}
