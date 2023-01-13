return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufRead",
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>" },
  },
  opts = {
    signs = false,
  },
}
