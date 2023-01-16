-- TODO: look into https://github.com/ggandor/leap-ast.nvim
return {
  'ggandor/leap.nvim',
  keys = {
    { 'f', '<Plug>(leap-forward-to)', mode = { 'n', 'x', 'o' } },
    { 'F', '<Plug>(leap-backward-to)', mode = { 'n', 'x', 'o' } },
    { 'gs', '<Plug>(leap-cross-window)' },
  },
}
