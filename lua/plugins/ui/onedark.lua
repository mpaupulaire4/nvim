return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme onedark")
  end,
  opts = {
    highlights = {
      DiagnosticUnderlineError = { style = "undercurl", sp = "${red}" },
      DiagnosticUnderlineWarn = { style = "undercurl", sp = '${yellow}', },
      DiagnosticUnderlineInfo = { style = "undercurl", sp = '${blue}', },
      DiagnosticUnderlineHint = { style = "undercurl", sp = '${cyan}', },
    }
  }
}
