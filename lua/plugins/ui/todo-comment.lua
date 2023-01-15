return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufRead",
  keys = {
    { "<leader>fc", "<cmd>TodoTelescope<cr>" },
  },
  opts = {
    signs = false,
  },
}
