local opt = vim.opt

opt.splitkeep = "screen"
opt.showmode = false
opt.title = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
-- opt.scrolloff = 999
opt.cul = true -- cursor line

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = {
  eob = " "
}
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers / Status Column
opt.number = true
opt.numberwidth = 2
opt.statuscolumn = "%=%{v:virtnum < 1 && &nu ? (&rnu && v:relnum ? v:relnum : v:lnum) : ''}%=%s"
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- Sessions
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Noice/ Experimental
opt.cmdheight = 0
