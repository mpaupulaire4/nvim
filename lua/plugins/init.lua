-- TODO: look into https://github.com/anuvyklack/hydra.nvim
--        especially for window management
-- TODO: look into a note taking plugin
--        - https://github.com/nvim-neorg/neorg
--        - https://github.com/phaazon/mind.nvim
--        - https://github.com/jakewvincent/mkdnflow.nvim
-- TODO: window resize plugins: Maybe adapt to what you need.
--        - https://github.com/anuvyklack/windows.nvim
--        - https://github.com/beauwilliams/focus.nvim
-- TODO: setup https://github.com/folke/neodev.nvim
-- TODO: setup and write plugins around instant.nvim for code pairing

return {

  "nathom/filetype.nvim",

  {
    'nmac427/guess-indent.nvim',
    event = "BufRead",
    opts = {
      auto_cmd = true,
    },
  },

  -- {
  --   "beauwilliams/focus.nvim",
  --   opt = true,
  --   config = "require('plugins.configs.focus')",
  --   setup = function()
  --     require("core.utils").packer_lazy_load "focus.nvim"
  --   end,
  -- }

  -- {
  --   "tpope/vim-dadbod",
  --   opt = true,
  --   setup = function()
  --     require("core.utils").packer_lazy_load "vim-dadbod"
  --   end,
  -- }

  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   after = "vim-dadbod",
  --   setup = "require('plugins.configs.dadbod')",
  -- }

  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   after = { "vim-dadbod", "nvim-cmp" },
  -- }

  { import = "plugins.core" },
  { import = "plugins.lsp" },
  { import = "plugins.git" },
  { import = "plugins.ui" },
  { import = "plugins.extra" },
}
