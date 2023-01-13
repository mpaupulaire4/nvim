return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      insert_only = true,
    },
    select = {
      enabled = true,
      get_config = function(opts)
        -- TODO: use opts to decide between cursor based or popup based
        return {
          -- Priority list of preferred vim.select implementations
          backend = "telescope",
          -- Options for telescope selector
          telescope = require('telescope.themes').get_cursor({}),
        }
      end,
    },
  }
}
