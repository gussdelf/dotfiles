local o = vim.opt
-- Termguicolors
o.termguicolors = true

-- Numbers
o.number = true
o.relativenumber = true

-- Cursorline
o.cursorline = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Chars
o.fillchars = { eob = " " }
o.listchars = { tab = "» " }

-- Others
o.guicursor = "n-i:blinkon100,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
o.background = "dark"
o.list = true
o.pumheight = 7
o.splitbelow = true
o.splitright = true
