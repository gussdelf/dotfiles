-- Termguicolors
vim.opt.termguicolors = true

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursorline
vim.opt.cursorline = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
-- vim: ts=2 sts=2 sw=2 et
