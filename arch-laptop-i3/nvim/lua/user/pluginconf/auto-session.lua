local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  vim.notify("Auto Session not found", "error")
  return
end

local t_status_ok, telescope = pcall(require, "telescope")
if not t_status_ok then
  return
end

local l_status_ok, session_lens = pcall(require, "session-lens")
if not l_status_ok then
  return
end

local opts = {
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = false,
  auto_session_use_git_branch = true,
  -- the configs below are lua only
  bypass_session_save_file_types = { "alpha", "NvimTree" },
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos"

telescope.load_extension "session-lens"

session_lens.setup {
  path_display = { "shorten" },
  previewer = false,
  prompt_title = "Sessions",
}

auto_session.setup(opts)

-- TODO: Telsecope space s t
