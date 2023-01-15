-- TODO: finish set up and style -
local function get_diagnostic_label(props)
  local icons = require('core.icons').diagnostic
  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      local fg = "#" ..
          string.format("%06x", vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"])
      table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
    end
  end
  return label
end

return {
  "b0o/incline.nvim",
  event = "WinNew",
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
          guifg = "#48b0bd",
        },
        InclineNormalNC = {
          default = true,
          group = "Normal"
        }
      }
    },
    ignore = {
      buftypes = {
        'acwrite',
        'nofile',
        'nowrite',
        'quickfix',
        'terminal',
        'prompt',
      },
      filetypes = {},
      floating_wins = true,
      unlisted_buffers = false,
      wintypes = "special"
    },
    window = {
      margin = {
        horizontal = 1,
        vertical = 0
      },
      options = {
        signcolumn = "no",
        wrap = false,
      },
      padding = 1,
      padding_char = " ",
      placement = {
        horizontal = "right",
        vertical = "top",
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
      zindex = 50,
    },
    render = function(props)
      local bufname = vim.api.nvim_buf_get_name(props.buf)
      local filename = vim.fn.fnamemodify(bufname, ":t")
      local diagnostics = get_diagnostic_label(props)
      local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
      local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

      local buffer = {
        { filetype_icon, guifg = color },
        { " " },
        { filename, gui = modified },
      }

      if #diagnostics > 0 then
        table.insert(diagnostics, { "| ", guifg = "grey" })
      end
      for _, buffer_ in ipairs(buffer) do
        table.insert(diagnostics, buffer_)
      end
      return diagnostics
    end,
  },
  init = function()
    vim.opt.laststatus = 3
  end,
}
