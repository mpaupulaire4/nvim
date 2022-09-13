local present, focus = pcall(require, "focus")
local map = require('core.utils').map

if not present then
  return
end

focus.setup {
  cursorline = false,
  signcolumn = false,
  cursorcolumn = false,
  excluded_filetypes = { 'fterm', 'term', 'toggleterm', 'dbui' }
}

map("n", "<C-A-Left>", "<cmd>FocusSplitLeft<CR>")
map("n", "<C-A-Right>", "<cmd>FocusSplitRight<CR>")
map("n", "<C-A-Up>", "<cmd>FocusSplitUp<CR>")
map("n", "<C-A-Down>", "<cmd>FocusSplitDown<CR>")
