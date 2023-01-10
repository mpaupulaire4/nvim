return {
  'olimorris/persisted.nvim',
  opts = {
    use_git_branch = true, -- create session files based on the branch of the git enabled repository
    should_autosave = nil, -- function to determine if a session should be autosaved
    follow_cwd = true, -- change session file name to match current working directory if it changes
    allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
    ignored_dirs = { '~/', '~/Projects' }, -- table of dirs that are ignored when auto-saving and auto-loading
    telescope = { -- options for the telescope extension
      before_source = nil, -- function to run before the session is sourced via telescope
      after_source = nil, -- function to run after the session is sourced via telescope
      reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
    },
  },
  keys = {
    {
      "<leader>sd",
      function()
        require("persisted").delete()
      end,
      desc = "Delete Current Session"
    },
    {
      "<leader>sl",
      "<cmd>Telescope persisted<CR>",
      desc = "List Sessions"
    },
    {
      "<leader>ss",
      function()
        require("persisted").save()
      end,
      desc = "Save Current Session"
    },
  },
}
