return {
  "navarasu/onedark.nvim",
  lazy = false,
  config = function()
    local onedark = require('onedark')
    onedark.setup {
      style = 'darker',
      toggle_style_key = "<C-S-t>"
    }
    onedark.load()
  end
}
