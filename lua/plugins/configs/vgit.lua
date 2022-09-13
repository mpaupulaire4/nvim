require('vgit').setup({
  keymaps = {
    ['n <leader>hp'] = 'hunk_up',
    ['n <leader>hn'] = 'hunk_down',
    ['n <leader>hs'] = 'buffer_hunk_stage',
    ['n <leader>hr'] = 'buffer_hunk_reset',
    ['n <leader>hd'] = 'buffer_hunk_preview',
    ['n <leader>gB'] = 'buffer_blame_preview',
    ['n <leader>gb'] = 'toggle_live_blame',
    ['n <leader>hD'] = 'buffer_diff_preview',
    ['n <leader>hh'] = 'buffer_history_preview',
    ['n <leader>hR'] = 'buffer_reset',
    ['n <leader>gg'] = 'buffer_gutter_blame_preview',
    -- ['n <leader>gd'] = 'project_hunks_preview',
    -- ['n <leader>gls'] = 'project_hunks_staged_preview',
    -- ['n <leader>gd'] = 'project_diff_preview',
    -- ['n <leader>gq'] = 'project_hunks_qf',
    -- ['n <leader>gx'] = 'toggle_diff_preference',
  },
  settings = {
    live_blame = {
      enabled = true,
    },
    scene = {
      diff_preference = 'split',
    },
    symbols = {
      void = '⣿',
      -- void = ' ',
    },
  }
})
