local present, gitsigns = pcall(require, "gitsigns")
if not present then
  return
end

gitsigns.setup {
  keymaps = {},
  current_line_blame = false,
  current_line_blame_opts = {
    ignore_whitespace = true
  },
  current_line_blame_formatter_opts = {
    relative_time = true
  },
}

local map = require('core.utils').map
map("n", "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
map("n", "<leader>hd", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
map("n", "<leader>hU", "<cmd>Gitsigns reset_buffer_index<CR>")
map("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>")
map("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>")
