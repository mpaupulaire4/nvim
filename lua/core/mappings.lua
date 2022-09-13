local utils = require "core.utils"

local map = utils.map
local cmd = vim.cmd

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
