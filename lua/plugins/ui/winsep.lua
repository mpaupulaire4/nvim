-- TODO: do more research. Manually set these colors if this isn't needed.
return {
  "nvim-zh/colorful-winsep.nvim",
  event = "WinNew",
  config = function(_, opts)
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'fg', bg = 'bg' })
    require('colorful-winsep').setup(opts)
  end,
  opts = {
    -- highlight for Window separator
    highlight = {
      -- bg = "#16161E",
      fg = "#48b0bd",
    },
    -- timer refresh rate
    interval = 30,
    -- This plugin will not be activated for filetype in the following table.
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  },
}
