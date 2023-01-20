local map = vim.keymap.set

-- keep normal <c-i> behaviour when tab is mapped
map("n", "<C-I>", "<C-I>")

-- Better jumts and tag follows
map("n", "<C-f>", '<C-]>')
-- map("n", "<C-->", '<C-o>')
-- map("n", "<C-'>", '<C-i>')

-- Alternate Esc
map({ "", "n", "v", "c" }, "<C-e>", '<Esc>')
-- map({"n", "i", "v", "c"}, "<Esc>", '<Nop>')
-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP')

-- insert mode and completion related
map({ "i", "n", "c", "v" }, "<C-e>", 'pumvisible() ? "<C-e>" : "<C-c>"', { expr = true })


-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- use ESC to turn off search highlighting
map("n", "<C-e>", "<cmd>noh<CR>")
map("n", "<Esc>", "<cmd>noh<CR>")

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

-- map("n", "<Tab>", "<cmd>bnext<CR>") -- next buffer
-- map("n", "<S-Tab>", "<cmd>bprevious<CR>") -- prev buffer

map("", "<C-q>", "<cmd>q<CR>") -- ctrl + q to quit

map("n", "<C-s>", "<cmd>w<CR>") -- ctrl + s to save file
map("i", "<C-s>", "<Esc><cmd>w<CR>") -- ctrl + s to save file

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
