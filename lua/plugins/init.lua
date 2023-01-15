-- TODO: setup and test https://github.com/ggandor/leap.nvim
-- TODO: setup and test syntax-tree-surfer
-- TODO: setup and test nvim-navic in tabline
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
}
