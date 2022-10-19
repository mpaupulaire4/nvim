local present, gitsigns = pcall(require, "gitsigns")
if not present then
  return
end

gitsigns.setup {
  keymaps = {},
  current_line_blame = false,
  current_line_blame_opts = {
    ignore_whitespace = true
  },
  current_line_blame_formatter_opts = {
    relative_time = true
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      require('core.utils').map(mode, l, r, opts)
    end

    map({ "v", "n" }, "<leader>hs", gs.stage_hunk)
    map({ "v", "n" }, "<leader>hr", gs.reset_hunk)
    map("n", "<leader>gb", gs.toggle_current_line_blame)
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hd", gs.preview_hunk)
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hU", gs.reset_buffer_index)
    map("n", "<leader>hn", gs.next_hunk)
    map("n", "<leader>hp", gs.prev_hunk)
  end,
}
