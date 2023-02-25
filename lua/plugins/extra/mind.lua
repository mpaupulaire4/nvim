return {
  'phaazon/mind.nvim',
  branch = 'v2.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>n', '<cmd>MindOpenSmartProject<cr>' },
  },
  opts = {
    persistence = {
      data_dir = "~/Projects/mind/data",
      state_path = "~/Projects/mind/mind.json"
    },
    keymaps = {
      normal = {
        ["<cr>"] = "open_data",
        ["<s-cr>"] = "open_data_index",
        ["<tab>"] = "toggle_node",
        ["<s-tab>"] = "toggle_node",
        ["/"] = "select_path",
        ["$"] = "change_icon_menu",
        c = "add_inside_end_index",
        I = "add_inside_start",
        i = "add_inside_end",
        y = "copy_node_link",
        Y = "copy_node_link_index",
        d = "delete",
        D = "delete_file",
        O = "add_above",
        o = "add_below",
        q = "quit",
        ['<c-e>'] = "quit",
        r = "rename",
        R = "change_icon",
        l = "make_url",
        x = "select",
      },

      selection = {
        ["<cr>"] = "open_data",
        ["<tab>"] = "toggle_node",
        ["/"] = "select_path",
        I = "move_inside_start",
        i = "move_inside_end",
        O = "move_above",
        o = "move_below",
        q = "quit",
        ['<c-e>'] = "quit",
        x = "select",
      }
    }
  },
}
