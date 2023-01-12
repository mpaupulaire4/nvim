return {
  "rcarriga/nvim-notify",
  lazy = true,
  init = function()
    vim.notify = function(...)
      vim.notify = require("notify")
      vim.notify(...)
    end
  end,
  config = function()
    local notify = require('notify')
    notify.setup({
      stages = "slide",
    })
    vim.notify = notify
  end
}
