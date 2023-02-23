-- TODO: finish setting up
return {
  "glepnir/lspsaga.nvim",
  keys = {
    { "<leader>r",  "<cmd>Lspsaga rename<cr>" },
    { "gd",         "<cmd>Lspsaga peek_definition<cr>" },
    { "gt",         "<cmd>Lspsaga peek_type_definition<cr>" },
    { "gr",         "<cmd>Lspsaga lsp_finder<cr>" },
    { "<leader>a",  "<cmd>Lspsaga code_action<cr>" },
    { "H",          "<cmd>Lspsaga hover_doc<cr>" },
    { "<leader>dd", "<cmd>Lspsaga show_line_diagnostics<cr>" },
    { "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
    { "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
    { "<leader>o",  "<cmd>Lspsaga outline<cr>" },
  },
  opts = {
    preview = {
      lines_above = 5,
      lines_below = 10,
    },
    scroll_preview = {
      scroll_down = "<PageDown>",
      scroll_up = "<PageUp>",
    },
    definition = {
      quit = '<c-e>'
    },
    finder = {
      keys = {
        quit = { 'q', '<esc>', '<c-e>' }
      }
    },
    code_action = {
      keys = {
        quit = { 'q', '<esc>', '<c-e>' }
      }
    },
    rename = {
      quit = '<c-e>'
    },
    lightbulb = {
      enable = true,
      enable_in_insert = false,
      sign = false,
      sign_priority = 40,
      virtual_text = true,
    },
    symbol_in_windbar = {
      enable = false
    }
  },
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    --Please make sure you install markdown and markdown_inline parser
    "nvim-treesitter/nvim-treesitter"
  }
}
