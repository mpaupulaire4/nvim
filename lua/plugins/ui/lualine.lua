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
          },
        },
        lualine_b = {
          'branch'
        },
        lualine_y = {
          'filetype',
        },
        lualine_z = {
          {
            'location',
          },
        },
      },
      inactive_sections = {},
      tabline = {},
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
