local map = require("core.utils").map
vim.g.db_ui_table_helpers = {

}

vim.g.db_ui_icons = {
    expanded = '▾',
    collapsed = '▸',
    saved_query = '*',
    new_query = '+',
    tables = '',
    buffers = '»',
    connection_ok = '',
    connection_error = '',
}

map("n", "<leader>db", "<cmd>DBUIToggle<CR>")
