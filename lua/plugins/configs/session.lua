require('auto-session').setup {
  log_level = 'error',
  auto_session_suppress_dirs = { '~/', '~/Projects' },
  auto_session_use_git_branch = true,
  auto_session_enabled = false,
  auto_save_enabled = true,
}
