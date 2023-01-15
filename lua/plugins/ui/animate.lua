return {
  'echasnovski/mini.animate',
  config = function()
    require('mini.animate').setup {
      -- Cursor path
      cursor = {
        -- Whether to enable this animation
        -- Not entirely sold on this yet.
        enable = true,
      },

      -- Vertical scroll
      scroll = {
        -- Whether to enable this animation
        enable = true,
      },

      -- Window resize
      resize = {
        -- Whether to enable this animation
        enable = true,
      },

      -- Window open
      open = {
        -- Whether to enable this animation
        enable = true,
      },

      -- Window close
      close = {
        -- Whether to enable this animation
        enable = true,
      },
    }
  end,

}
