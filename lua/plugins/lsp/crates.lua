return {
  'saecki/crates.nvim',
  version = "v0.3.0",
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { "BufRead Cargo.toml" },
  config = function()
    -- NOTE Also supports coq
    require('crates').setup {
      null_ls = {
        enabled = true,
      }
      -- TODO uncomment if switching to coq
      -- src = {
      --   coq = {
      --     enabled = true,
      --   },
      -- },
    }
    vim.api.nvim_create_autocmd("BufRead", {
      group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
      pattern = "Cargo.toml",
      callback = function()
        require('cmp').setup.buffer({ sources = { { name = "crates" } } })
      end,
    })
  end
}
