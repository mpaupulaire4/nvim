return {
  'sindrets/diffview.nvim',
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>" },
    { "<leader>gh", ":'<,'>DiffviewFileHistory<CR>" },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local actions = require("diffview.actions")
    require("diffview").setup({
      diff_binaries = false, -- Show diffs for binaries
      enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
      git_cmd = { "git" }, -- The git executable followed by default args.
      use_icons = true, -- Requires nvim-web-devicons
      icons = { -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
      },
      file_panel = {
        listing_style = "tree", -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
          flatten_dirs = true, -- Flatten dirs that only contain one single dir
          folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = { -- See ':h diffview-config-win_config'
          position = "right",
          width = 35,
        },
      },
      file_history_panel = {
        git = {
          log_options = { -- See ':h diffview-config-log_options'
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = { -- See ':h diffview-config-win_config'
          position = "bottom",
          height = 16,
        },
      },
      commit_log_panel = {
        win_config = {}, -- See ':h diffview-config-win_config'
      },
      default_args = { -- Default args prepended to the arg-list for the listed commands
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {}, -- See ':h diffview-config-hooks'
      keymaps = {
        disable_defaults = true, -- Disable the default keymaps
        view = {
          -- The `view` bindings are active in the diff buffers, only when the current
          -- tabpage is a Diffview.
          ["<tab>"]   = actions.select_next_entry, -- Open the diff for the next file
          ["<s-tab>"] = actions.select_prev_entry, -- Open the diff for the previous file
          -- ["<C-w><C-f>"] = actions.goto_file_split,   -- Open the file in a new split
          -- ["<C-w>gf"]    = actions.goto_file_tab,     -- Open the file in a new tabpage
          -- ["<c-n>"]  = actions.focus_files,       -- Bring focus to the files panel
          ["<c-n>"]   = actions.toggle_files, -- Toggle the files panel.
          ["<c-q>"]   = actions.close,
          ["<c-e>"]   = actions.close,
        },
        panel = {
          ["<c-q>"]      = actions.close,
          ["<c-e>"]      = actions.close,
          ["<c-n>"]      = actions.toggle_files,
          ["<up>"]       = actions.prev_entry,
          ["<down>"]     = actions.next_entry,
          ["<PageUp>"]   = actions.scroll_view(-0.25), -- Scroll the view up
          ["<PageDown>"] = actions.scroll_view(0.25), -- Scroll the view down
        },
        file_panel = {
          ["<cr>"]       = actions.select_entry, -- Open the diff for the selected entry.
          ["-"]          = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
          -- ["S"]             = actions.stage_all,          -- Stage all entries.
          -- ["U"]             = actions.unstage_all,        -- Unstage all entries.
          ["r"]          = actions.restore_entry, -- Restore entry to the state on the left side.
          ["R"]          = actions.refresh_files, -- Update stats and entries in the file list.
          -- ["L"]             = actions.open_commit_log,    -- Open the commit log panel.
          -- ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
          -- ["<c-f>"]         = actions.scroll_view(0.25),  -- Scroll the view down
          ["gf"]         = actions.goto_file,
          ["<PageUp>"]   = actions.scroll_view(-0.25), -- Scroll the view up
          ["<PageDown>"] = actions.scroll_view(0.25), -- Scroll the view down
          -- ["<C-w><C-f>"]    = actions.goto_file_split,
          -- ["<C-w>gf"]       = actions.goto_file_tab,
          -- ["i"]             = actions.listing_style,        -- Toggle between 'list' and 'tree' views
          -- ["f"]             = actions.toggle_flatten_dirs,  -- Flatten empty subdirectories in tree listing style.
          -- ["<c-n>"]     = actions.focus_files,
        },
        file_history_panel = {
          ["<cr>"]       = actions.select_entry,
          ["?"]          = actions.options, -- Open the option panel
          ["<C-A-d>"]    = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
          ["y"]          = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
          ["L"]          = actions.open_commit_log,
          ["zR"]         = actions.open_all_folds,
          ["zM"]         = actions.close_all_folds,
          ["<C-w><C-f>"] = actions.goto_file_split,
          ["<C-w>gf"]    = actions.goto_file_tab,
          ["<leader>e"]  = actions.focus_files,
          ["<leader>b"]  = actions.toggle_files,
        },
        option_panel = {
          ["<tab>"] = actions.select_entry,
          ["q"]     = actions.close,
        },
      },
    })
  end,
}
