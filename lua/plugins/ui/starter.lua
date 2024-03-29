local logo = [[
         ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆
          ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦
                ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄
                 ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄
                ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀
         ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄
        ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄
       ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄
       ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄
            ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆
             ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃
]]
return {
  -- TODO: look into alpha. See if it is faster  and fixes `InsertEnter` event issues.
  'echasnovski/mini.starter',
  branch = 'stable',
  config = function()
    local starter = require('mini.starter')
    starter.setup {
      -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
      -- started with intent to show something else.
      autoopen = true,

      -- Whether to evaluate action of single active item
      evaluate_single = false,

      -- Items to be displayed. Should be an array with the following elements:
      -- - Item: table with <action>, <name>, and <section> keys.
      -- - Function: should return one of these three categories.
      -- - Array: elements of these three types (i.e. item, array, function).
      -- If `nil` (default), default items will be used (see |mini.starter|).
      items = {
        function()
          local sess = require 'persisted'
          local utils = require 'persisted.utils'
          local files = sess.list()

          return vim.tbl_map(function(entry)
            return {
              name = entry.name,
              section = 'Sessions',
              action = function()
                vim.g.persisting_session = entry.file_path
                utils.load_session(entry.file_path)
              end,
            }
          end, files)
        end,
        starter.sections.recent_files(10, true, false),
        starter.sections.builtin_actions,
      },

      -- Header to be displayed before items. Converted to single string via
      -- `tostring` (use `\n` to display several lines). If function, it is
      -- evaluated first. If `nil` (default), polite greeting will be used.
      header = logo,

      -- Footer to be displayed after items. Converted to single string via
      -- `tostring` (use `\n` to display several lines). If function, it is
      -- evaluated first. If `nil` (default), default usage help will be shown.
      footer = nil,

      -- Array  of functions to be applied consecutively to initial content.
      -- Each function should take and return content for 'Starter' buffer (see
      -- |mini.starter| and |MiniStarter.content| for more details).
      content_hooks = {
        starter.gen_hook.aligning('center', 'center'),
        -- starter.gen_hook.indexing('section'),
      },

      -- Characters to update query. Each character will have special buffer
      -- mapping overriding your global ones. Be careful to not add `:` as it
      -- allows you to go into command mode.
      query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
    }
  end
}
