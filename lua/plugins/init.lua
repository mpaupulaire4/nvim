-- TODO add todo-comments.nvim
-- TODO add https://github.com/nvim-treesitter/nvim-treesitter-refactor
-- TODO add https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- TODO setup and test https://github.com/ggandor/leap.nvim
-- TODO setup and test syntax-tree-surfer
-- TODO setup and test nvim-navic in tabline
-- TODO setup and write plugins around instant.nvim for code pairing

return {

  "nathom/filetype.nvim",
  -- TODO: add as dependencies where it is one and remove from here.
  -- "nvim-lua/plenary.nvim",


  -- TODO: add as dependencies where it is one and remove from here.
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
    config = true,
  },
  -- using packer.nvim
  {
    'nmac427/guess-indent.nvim',
    event = "BufRead",
    config = true,
  },

  -- TODO break up and import only used plugins
  -- TODO need to revisit for  lazy.nvim
  -- {
  --   'echasnovski/mini.nvim',
  --   branch = 'stable',
  --   config = "require('plugins.configs.mini')",
  -- }

  -- file managing , picker etc
  {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    opt = true,
    config = "require('plugins.configs.telescope')",
    setup = function()
      require("core.utils").packer_lazy_load "telescope.nvim"
    end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    after = "telescope.nvim",
    run = 'make',
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  {
    "stevearc/dressing.nvim",
    after = "telescope.nvim",
    config = "require('plugins.configs.dressing')",
  },

  {
    "rcarriga/nvim-notify",
    after = "dressing.nvim",
    config = "require('plugins.configs.nvim-notify')",
  },

  -- {
  --   "DanilaMihailov/beacon.nvim",
  --   opt = true,
  --   setup = function()
  --     require("core.utils").packer_lazy_load "beacon.nvim"
  --   end
  -- }

  -- {
  --   "beauwilliams/focus.nvim",
  --   opt = true,
  --   config = "require('plugins.configs.focus')",
  --   setup = function()
  --     require("core.utils").packer_lazy_load "focus.nvim"
  --   end,
  -- }
  --
  {
    'luukvbaal/stabilize.nvim',
    opt = true,
    config = "require('plugins.configs.stabilize')",
    setup = function()
      require("core.utils").packer_lazy_load "stabilize.nvim"
    end
  },

  {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
    opt = true,
    config = "require('plugins.configs.toggleterm')",
    setup = function()
      require("core.utils").packer_lazy_load "toggleterm.nvim"
    end,
  },

  -- {
  --   "tpope/vim-dadbod",
  --   opt = true,
  --   setup = function()
  --     require("core.utils").packer_lazy_load "vim-dadbod"
  --   end,
  -- }
  --
  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   after = "vim-dadbod",
  --   setup = "require('plugins.configs.dadbod')",
  -- }
  --
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   after = { "vim-dadbod", "nvim-cmp" },
  -- }

  {
    'saecki/crates.nvim',
    after = { "nvim-cmp" },
    event = { "BufRead Cargo.toml" },
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.configs.crates')",
  },

  {
    "chentoast/marks.nvim",
    opt = true,
    config = "require('plugins.configs.marks')",
    setup = function()
      require("core.utils").packer_lazy_load "marks.nvim"
    end,
  },
}
