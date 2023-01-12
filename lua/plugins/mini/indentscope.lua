require('mini.indentscope').setup {
  draw = {
    -- Delay (in ms) between event and start of drawing scope indicator
    delay = 100,

    -- Animation rule for scope's first drawing. A function which, given next
    -- and total step numbers, returns wait time (in ms). See
    -- |MiniIndentscope.gen_animation()| for builtin options. To not use
    -- animation, supply `require('mini.indentscope').gen_animation('none')`.
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Textobjects
    object_scope = '',
    object_scope_with_border = '',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '',
    goto_bottom = '',
  },

  -- Options which control computation of scope. Buffer local values can be
  -- supplied in buffer variable `vim.b.miniindentscope_options`.
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent. Useful to
    -- see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = true,
  },

  -- Which character to use for drawing scope indicator
  symbol = '╎',
}

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserIndentScopeFileTypeDisable", { clear = true }),
  pattern = {
    'help',
    'terminal',
    'neo-tree',
    'dashboard',
    'alpha',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
  },
  callback = function()
  --   vim.cmd [[
  --     au FileType * if index([ 'help', 'terminal', 'neo-tree', 'dashboard', 'alpha', 'packer', 'lspinfo', 'TelescopePrompt', 'TelescopeResults'], &ft) >= 0 | let b:miniindentscope_disable=v:true | endif
  -- ]]
  end,
})
