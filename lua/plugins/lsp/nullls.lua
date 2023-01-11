local eslint_config_files = {
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
}

local prettier_config_files = {
  ".prettierrc",
  ".prettierrc.js",
  ".prettierrc.cjs",
  "prettier.config.js",
  "prettier.config.cjs",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.toml",
}


return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  config = function()
    local builtins = require("null-ls").builtins
    require("null-ls").setup({
      sources = {
        builtins.diagnostics.eslint_d.with({
          extra_filetypes = { "svelte" },
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        builtins.code_actions.eslint_d.with({
          extra_filetypes = { "svelte" },
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file(prettier_config_files)
          end,
        }),
      },
    })
  end
}
