return {
  'echasnovski/mini.cursorword',
  branch = 'stable',
  event = "BufRead",
  config = function()
    require('mini.cursorword').setup {}
  end
}
