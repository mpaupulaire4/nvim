local M = {}

M.map = function(mode, keys, command, opt)
   local options = { noremap = true, silent = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   vim.keymap.set(mode, keys, command, opt)
end

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

return M
