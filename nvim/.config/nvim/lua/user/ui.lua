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

vim.opt.guicursor =  "n-i:blinkon100,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
