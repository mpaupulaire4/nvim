local present, focus = pcall(require, "focus")

if not present then
   return
end

focus.setup {
  cursorline = false,
  signcolumn = false,
  cursorcolumn = false,
}

