-- NOTE: when changing comment plugins look into nvim-ts-context-commentstring integrations
return {
  "numToStr/Comment.nvim",
  keys = {
    { '<leader>c', mode = { 'n', 'v' } },
    { '<leader>b', mode = { 'n', 'v' } },
  },
  config = function()
    require('Comment').setup {
      ---Add a space b/w comment and the line
      ---@type boolean
      padding = true,

      ---Whether the cursor should stay at its position
      ---This only affects NORMAL mode mappings and doesn't work with dot-repeat
      ---@type boolean
      sticky = false,

      ---LHS of toggle mappings in NORMAL + VISUAL mode
      ---@type table
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>cc',
        ---Block-comment toggle keymap
        block = '<leader>bb',
      },

      ---LHS of operator-pending mappings in NORMAL + VISUAL mode
      ---@type table
      opleader = {
        ---Line-comment keymap
        line = '<leader>c',
        ---Block-comment keymap
        block = '<leader>b',
      },

      ---LHS of extra mappings
      ---@type table
      extra = {
        ---Add comment on the line above
        above = '<leader>cO',
        ---Add comment on the line below
        below = '<leader>co',
        ---Add comment at the end of line
        eol = '<leader>ca',
      },

      ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
      ---@type table
      mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
