return {
  'echasnovski/mini.surround',
  branch = 'stable',
  keys = {
    { 'sa', mode = { 'n', 'v' } },
    'sd',
    'sf',
    'sF',
    'sh',
    'sr',
  },
  config = function()
    require('mini.surround').setup {
      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 2000,

      -- Pattern to match function name in 'function call' surrounding
      -- By default it is a string of letters, '_' or '.'
      -- funname_pattern = '[%w_%.]+',

      -- Module mappings. Use `'' (empty string) to disable one.
      mappings = {
        add = 'sa', -- Add surrounding
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        -- update_n_lines = 'sn', -- Update n_lines`
        update_n_lines = '',
      },
    }
  end,
}
