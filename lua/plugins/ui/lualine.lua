local filename = {
  'filename',
  path = 1,
  symbols = {
    modified = ""
  }
}

return {
  'nvim-lualine/lualine.nvim',
  event = "BufRead",
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  init = function()
    vim.opt.laststatus = 3
  end,
  config = function()
    local navic = require("nvim-navic")

    require('lualine').setup {
      options = {
        theme = 'onedark',
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          "help",
          "starter",
          "NvimTree",
          "neo-tree",
          "terminal",
          "dbui",
          "dbout",
        }
      },
      sections = {
        lualine_a = {
          {
            'mode',
            -- separator = { right = '' },
            -- right_padding = 2
          },
        },
        lualine_b = {
          'branch'
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          'filetype',
        },
        lualine_z = {
          {
            'location',
            -- separator = { left = '' },
            -- left_padding = 2
          },
        },
      },
      inactive_sections = {
        -- lualine_a = {
        --   {
        --     'filename',
        --     path = 1,
        --     symbols = {
        --       modified = " "
        --     }
        --   },
        -- },
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = { 'location' },
      },
      tabline = {
        -- lualine_a = {
        --   {
        --     'buffers',
        --     -- show_filename_only = false,
        --     filetype_names = {
        --       TelescopePrompt = 'Telescope',
        --       dashboard = 'Dashboard',
        --       packer = 'Packer',
        --       fzf = 'FZF',
        --       alpha = 'Alpha',
        --       dbui = 'Dadbod'
        --     }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
        --   },
        --   -- {
        --   --   'filename',
        --   --   separator = {
        --   --     -- left = '',
        --   --     right = ''
        --   --   },
        --   --   right_padding = 2,
        --   --   path = 1,
        --   --   symbols = {
        --   --     modified = " "
        --   --   }
        --   -- },
        --   -- { 'mode', separator = { left = '' }, right_padding = 2 },
        -- },
        -- lualine_c = {
        -- },
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = {
        --   "tabs"
        --   -- { 'location', separator = { right = '' }, left_padding = 2 },
        -- },
      },
      winbar = {
        lualine_a = {
          filename,
        },
        lualine_c = {
          {
            navic.get_location,
            cond = navic.is_available
          },
        },
        lualine_y = {
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            colored = true, -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false, -- Show diagnostics even if there are none.
          },
        }

      },
      inactive_winbar = {
        lualine_a = {
          filename,
        }
      },
      extensions = {
        "neo-tree",
        "toggleterm"
      },
    }
  end,
}
