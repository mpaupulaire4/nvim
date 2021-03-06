local present, packer = pcall(require, "plugins.packerInit")

if not present then
  return false
end

local use = packer.use

return packer.startup(function()

  -- this is arranged on the basis of when a plugin starts
  use "nathom/filetype.nvim"
  use "nvim-lua/plenary.nvim"

  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  use {
    "navarasu/onedark.nvim",
    config = "require('plugins.configs.onedark')"
  }

  use {
    "kyazdani42/nvim-web-devicons",
    after = "onedark.nvim",
    config = "require('plugins.configs.icons')",
  }

  use {
    'tpope/vim-sleuth',
    event = "BufRead",
  }

  use {
    "mg979/vim-visual-multi",
    event = "BufRead",
    setup = "require('plugins.configs.visualmulti')",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = "require('plugins.configs.others').colorizer()",
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = "require('plugins.configs.treesitter')",
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }

  use {
    'RRethy/nvim-treesitter-textsubjects',
    after = 'nvim-treesitter'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.configs.lualine')"
  }

  use {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = "require('plugins.configs.mini')",
    setup = function()
      require("core.mappings").mini()
    end,
  }

  -- git stuff
  use {
    'lewis6991/gitsigns.nvim',
    opt = true,
    config = "require('plugins.configs.gitsigns')",
    setup = function()
      require("core.utils").packer_lazy_load "gitsigns.nvim"
      require("core.mappings").gitsigns()
    end,
  }

  use {
    'sindrets/diffview.nvim',
    opt = true,
    requires = 'nvim-lua/plenary.nvim',
    config = "require('plugins.configs.diffview')",
    setup = function()
      require("core.utils").packer_lazy_load "diffview.nvim"
      require("core.mappings").diffview()
    end,
  }

  -- lsp stuff

  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
      require("core.mappings").lspconfig()
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = "require('plugins.configs.nullls')",
    requires = "plenary.nvim",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-lspconfig",
  }

  use {
    "simrat39/rust-tools.nvim",
    after = "nvim-lspconfig",
  }

  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = "require('plugins.configs.signature')",
  }

  use {
    "williamboman/nvim-lsp-installer",
    after = "cmp-nvim-lsp",
    -- config = "require('plugins.configs.lspconfig')",
    config = function()
      require('plugins.configs.lspconfig')
    end,
  }


  use {
    "andymass/vim-matchup",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "vim-matchup"
    end,
  }

  -- completion related
  use {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    -- config = "require('plugins.configs.luasnip')",
  }

  use {
    "hrsh7th/nvim-cmp",
    after = "LuaSnip",
    config = "require('plugins.configs.nvim-cmp')",
  }


  use {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  }

  use {
    "ray-x/cmp-treesitter",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
  }

  use {
    "numToStr/Comment.nvim",
    opt = true,
    config = "require('plugins.configs.comment')",
    setup = function()
      require("core.utils").packer_lazy_load "Comment.nvim"
    end
  }

  -- file managing , picker etc
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = "require('plugins.configs.neotree')",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    setup = function()
      require("core.mappings").neotree()
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    opt = true,
    config = "require('plugins.configs.telescope')",
    setup = function()
      require("core.utils").packer_lazy_load "telescope.nvim"
      require("core.mappings").telescope()
    end,
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    after = "telescope.nvim",
    run = 'make',
    config = function()
      require("telescope").load_extension "fzf"
    end,
  }

  use {
    "stevearc/dressing.nvim",
    after = "telescope.nvim",
    config = "require('plugins.configs.dressing')",
  }

  use {
    "rcarriga/nvim-notify",
    after = "dressing.nvim",
    config = "require('plugins.configs.nvim-notify')",
  }

  use {
    "DanilaMihailov/beacon.nvim",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "beacon.nvim"
    end
  }

  use {
    "beauwilliams/focus.nvim",
    opt = true,
    config = "require('plugins.configs.focus')",
    setup = function()
      require("core.utils").packer_lazy_load "focus.nvim"
      require("core.mappings").focus()
    end,
  }

  use {
    'luukvbaal/stabilize.nvim',
    opt = true,
    config = "require('plugins.configs.stabilize')",
    setup = function()
      require("core.utils").packer_lazy_load "stabilize.nvim"
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*',
    opt = true,
    config = "require('plugins.configs.toggleterm')",
    setup = function()
      require("core.utils").packer_lazy_load "toggleterm.nvim"
      require("core.mappings").toggleterm()
    end,
  }

  use {
    "tpope/vim-dadbod",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "vim-dadbod"
    end,
  }

  use {
    "kristijanhusak/vim-dadbod-ui",
    after = "vim-dadbod",
    setup = "require('plugins.configs.dadbod')",
  }

  use {
    "kristijanhusak/vim-dadbod-completion",
    after = { "vim-dadbod", "nvim-cmp" },
  }

  use {
    'saecki/crates.nvim',
    after = { "nvim-cmp" },
    event = { "BufRead Cargo.toml" },
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.configs.crates')",
  }

end)
