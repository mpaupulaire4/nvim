return {
  "b0o/incline.nvim",
  lazy = true,
  event = "WinEnter",
  opts = {
    debounce_threshold = {
      falling = 50,
      rising = 10
    },
    hide = {
      cursorline = false,
      focused_win = false,
      only_win = false
    },
    highlight = {
      groups = {
        InclineNormal = {
          default = true,
          group = "NormalFloat"
        },
        InclineNormalNC = {
          default = true,
          group = "NormalFloat"
        }
      }
    },
    ignore = {
      buftypes = "special",
      filetypes = {},
      floating_wins = true,
      unlisted_buffers = false,
      wintypes = "special"
    },
    render = "basic",
    window = {
      margin = {
        horizontal = 1,
        vertical = 1
      },
      options = {
        signcolumn = "no",
        wrap = false
      },
      padding = 1,
      padding_char = " ",
      placement = {
        horizontal = "right",
        vertical = "top"
      },
      width = "fit",
      winhighlight = {
        active = {
          EndOfBuffer = "None",
          Normal = "InclineNormal",
          Search = "None"
        },
        inactive = {
          EndOfBuffer = "None",
          Normal = "InclineNormalNC",
          Search = "None"
        }
      },
      zindex = 50
    }
  },
  init = function()
    vim.opt.laststatus = 3
  end,
}