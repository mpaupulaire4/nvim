return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme onedark")
  end,
  opts = {
    highlights = {
      DiagnosticUnderlineError = { sp = "${yellow}", style = "undercurl" },
      DiagnosticUnderlineWarn = { sp = '${yellow}', style = "undercurl" },
      DiagnosticUnderlineInfo = { sp = '${blue}', style = "undercurl" },
      DiagnosticUnderlineHint = { sp = '${cyan}', style = "undercurl" },
    }
  }
}
