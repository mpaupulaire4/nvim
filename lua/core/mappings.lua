local utils = require "core.utils"

local map = utils.map
local cmd = vim.cmd

local M = {}

-- these mappings will only be called during initialization
M.misc = function()
   -- Better jumts and tag follows
   map("n", "<C-f>", '<C-]>')
   -- map("", "<C-[>", '<C-o>')
   -- map("", "<C-]>", '<C-i>')

   -- Alternate Esc
   map({ "", "n", "v", "c" }, "<C-e>", '<Esc>')
   -- map({"n", "i", "v", "c"}, "<Esc>", '<Nop>')
   -- Don't copy the replaced text after pasting in visual mode
   map("v", "p", '"_dP')

   -- Replace text and go to insert mode
   -- map("v", "i", '"_di')

   -- insert mode and completion related
   map("i", "<C-e>", 'pumvisible() ? "<C-e>" : "<C-c>"', { expr = true })
   map("i", "<Esc>", 'pumvisible() ? "<C-e>" : "<C-c>"', { expr = true })
   map("i", "<BS>", 'pumvisible() ? "<C-e><BS>"  : "<BS>"', { expr = true })
   map("i", "<CR>", 'pumvisible() ? (complete_info().selected == -1 ? "<C-e><CR>" : "<C-y>") : "<CR>"', { expr = true })
   map("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
   map("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

   -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
   -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
   -- empty mode is same as using :map
   -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
   map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
   map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
   map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
   map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

   -- use ESC to turn off search highlighting
   map("n", "<C-e>", ":noh <CR>")
   map("n", "<Esc>", ":noh <CR>")

   -- yank from current cursor to end of line
   -- map("n", "Y", "yg$")

   -- don't yank text on cut ( x )
   -- map({ "n", "v" }, "x", '"_x')

   -- don't yank text on delete ( dd )
   map({ "n", "v" }, "d", '"_d')

   -- navigation within insert mode
   -- map("i", "<Home>", "<ESC>^i")

   map("n", "<leader>n", ":set rnu! <CR>") -- toggle numbers
   map("n", "<C-a>", "ggVG") -- select whole file content

   -- map("n", "<S-t>", ":enew <CR>") -- new buffer
   -- map("n", "<C-t>", ":tabnew <CR>") -- new tabs

   map("n", "<Tab>", "<cmd>bnext<CR>") -- next buffer
   map("n", "<S-Tab>", "<cmd>bprevious<CR>") -- prev buffer

   map({ "n", "i" }, "<C-q>", "<cmd>q <CR>") -- ctrl + q to quit

   map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file
   map("i", "<C-s>", "<Esc>:w <CR>") -- ctrl + s to save file

   -- better tabbing
   map("v", "<", "<gv")
   map("v", ">", ">gv")

   -- Move Line(s) Up
   map("n", "<A-Up>", "<cmd>m .-2<CR>==")
   map("i", "<A-Up>", "<Esc>:m .-2<CR>==i")
   map("v", "<A-Up>", ":m '<-2<CR>gv=gv")
   -- Move Line(s) Down
   map("n", "<A-Down>", ":m .+1<CR>==")
   map("i", "<A-Down>", "<Esc>:m .+1<CR>==i")
   map("v", "<A-Down>", ":m '>+1<CR>gv=gv")

   -- Duplicate Line(s) Up
   map("n", "<S-A-Up>", "\"9Y\"9P")
   map("i", "<S-A-Up>", "<Esc>\"9Y\"9Pi")
   map("v", "<S-A-Up>", "\"9Y\"9P`[v`]")
   -- Duplicate Line(s) Down
   map("n", "<S-A-Down>", "\"9Y\"9p")
   map("i", "<S-A-Down>", "<Esc>\"9Y\"9pi")
   map("v", "<S-A-Down>", "\"9Y\"9Pgv")

   -- Add Packer commands because we are not loading it at startup
   cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
   cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
   cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
   cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
   cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
   cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

end

-- below are all plugin related mappings

M.focus = function()
   -- easier navigation between windows
   map("n", "<C-A-Left>", "<cmd>FocusSplitLeft<CR>")
   map("n", "<C-A-Right>", "<cmd>FocusSplitRight<CR>")
   map("n", "<C-A-Up>", "<cmd>FocusSplitUp<CR>")
   map("n", "<C-A-Down>", "<cmd>FocusSplitDown<CR>")
end

M.mini = function()
   map("n", "<C-c>", "<cmd>lua MiniBufremove.delete()<CR>")
end

M.diffview = function()
   map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
end

-- M.dashboard = function()
--    map("n", "<leader>fn", ":DashboardNewFile <CR>")
--    map("n", "<leader>db", ":Dashboard <CR>")
--    map("n", "<leader>l", ":SessionLoad <CR>")
--    map("n", "<leader>s", ":SessionSave <CR>")
-- end

M.lspconfig = function()
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   -- map("n", m.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>")
   -- map("n", m.definition, "<cmd>lua vim.lsp.buf.definition()<CR>")
   map("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>")
   -- map("n", m.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>")
   map("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
   -- map("n", m.add_workspace_folder, "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
   -- map("n", m.remove_workspace_folder, "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
   -- map("n", m.list_workspace_folders, "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
   -- map("n", m.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>")
   map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
   map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
   -- map("n", m.references, "<cmd>lua vim.lsp.buf.references()<CR>")
   map("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>")
   map("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
   map("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
   -- map("n", m.set_loclist, "<cmd>lua vim.diagnostic.setloclist()<CR>")
   map("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
end

M.neotree = function()
   map("n", "<C-n>", "<cmd>:Neotree filesystem float toggle reveal<CR>")
   -- map("n", plugin_maps.nvimtree.focus, ":NvimTreeFocus <CR>")
end

M.telescope = function()
   map("n", "<leader>fb", "<cmd>Telescope buffers <CR>")
   map("n", "<leader>ff", "<cmd>Telescope find_files <CR>")
   map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>")
   map("n", "<leader>fh", "<cmd>Telescope help_tags <CR>")
   map("n", "<leader>fw", "<cmd>Telescope live_grep <CR>")
   map("n", "<leader>fo", "<cmd>Telescope oldfiles <CR>")
   map("n", "<leader>ft", "<cmd>Telescope termfinder find <CR>")

   -- LSP related
   map("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
   map("n", "gr", "<cmd>Telescope lsp_references<cr>")
   map("n", "<leader>da", "<cmd>Telescope diagnostics<cr>")
   map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>")
end

M.toggleterm = function()
   map("n", "<leader>gs", "<cmd>lua _lazygit_toggle()<CR>")
   map("n", "<leader>do", "<cmd>lua _lazydocker_toggle()<CR>")
end

M.dadbod = function()
   map("n", "<leader>dd", "<cmd>DBUIToggle<CR>")
end

M.gitsigns = function()
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
end

return M
