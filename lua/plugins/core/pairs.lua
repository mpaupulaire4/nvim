-- NOTE: special logic is needed if using coq.nvim
return {
  "windwp/nvim-autopairs",
  event = "BufRead",
  opts = {
    disable_filetype = { "TelescopePrompt", "DressingInput" },
  }
}
