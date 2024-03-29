return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-textsubjects',
    "windwp/nvim-ts-autotag",
    { 'nvim-treesitter/nvim-treesitter-context', opts = {} },
    "andymass/vim-matchup",
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "json",
        "lua",
        "javascript",
        "typescript",
        "css",
        "ruby",
        "rust",
        "go",
        "sql",
        "svelte",
        "html",
        "toml",
        "vim",
        "help",
        "markdown",
        "markdown_inline",
      },
      autotag = {
        enable = true,
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      matchup = {
        enable = true
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
          },
        },
      },
      textsubjects = {
        enable = true,
        -- prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
          ['ii'] = 'textsubjects-smart',
        },
      },
      context = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }
  end,
}
