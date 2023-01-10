-- TODO setup and test leap.nvim
-- TODO setup and test syntax-tree-surfer
-- TODO setup and test nvim-navic in tabline
-- TODO setup and write plugins around instant.nvim for code pairing


-- NOTE this file is for core plugins
return {

  "nathom/filetype.nvim",
  -- TODO: add as dependencies where it is one and remove from here.
  "nvim-lua/plenary.nvim",


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

  -- Git
  -- TODO look into refactoring this to use nui and make it prettier/ better to use maybe even add lazygit features
  -- {
  --   'tanvirtin/vgit.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = "require('plugins.configs.vgit')",
  --   setup = function()
  --     require("core.utils").packer_lazy_load "vgit.nvim"
  --   end,
  -- }


  -- lsp stuff

  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "mason-lspconfig.nvim",
    config = "require('plugins.configs.nullls')",
    requires = "plenary.nvim",
  },

  {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = "require('plugins.configs.signature')",
  },

  {
    "andymass/vim-matchup",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "vim-matchup"
    end,
  },

  -- completion related
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
  },

  {
    "hrsh7th/nvim-cmp",
    after = "LuaSnip",
    config = "require('plugins.configs.nvim-cmp')",
  },


  {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  },

  {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp",
  },

  {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  },

  {
    "ray-x/cmp-treesitter",
    after = "nvim-cmp",
  },

  {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  },

  {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
  },

  {
    "numToStr/Comment.nvim",
    opt = true,
    config = "require('plugins.configs.comment')",
    setup = function()
      require("core.utils").packer_lazy_load "Comment.nvim"
    end
  },

  -- file managing , picker etc
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = "require('plugins.configs.neotree')",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },

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
