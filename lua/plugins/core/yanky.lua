return {
  "gbprod/yanky.nvim",
  keys = {
    { "p",     "<Plug>(YankyPutAfter)",    mode = { "n", "x" }, },
    { "P",     "<Plug>(YankyPutBefore)",   mode = { "n", "x" }, },
    { "<c-p>", "<Plug>(YankyRingHistory)", mode = { "n", "x" }, },
    { "y",     "<Plug>(YankyYank)",        mode = { "n", "x" }, },
  },
  opts = {
    ring = {
      history_length = 10,
    }
  }
}
