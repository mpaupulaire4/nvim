-- TODO do more research. Manually set these values.
return {
  "nvim-zh/colorful-winsep.nvim",
  lazy = true,
  event = "WinEnter",
  opts = {
    -- highlight for Window separator
    highlight = {
      -- bg = "#16161E",
      fg = "#4fa6ed",
    },
    -- timer refresh rate
    interval = 30,
    -- This plugin will not be activated for filetype in the following table.
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  }
}
