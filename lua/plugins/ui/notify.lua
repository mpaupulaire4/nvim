return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require('notify')
    notify.setup({
      stages = "slide",
    })
    vim.notify = notify
  end
}
