vim.g.minitrailspace_disable = true
require('mini.trailspace').setup {
  only_in_normal_buffers = true
}
vim.cmd [[ autocmd BufWrite * lua MiniTrailspace.trim() ]]
