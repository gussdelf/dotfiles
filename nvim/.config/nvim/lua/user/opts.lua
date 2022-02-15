local o = vim.opt

-- Indent
o.smartindent = true
o.autoindent = true

-- I prefer tabs over spaces
-- o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4

-- Clipboard
o.clipboard = "unnamedplus"

-- Mouse
o.mouse = "a"

-- Undo
o.undofile = true

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true

-- Filetypes
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

-- Others
o.compatible = false
o.so = 5
o.swapfile = false
o.background = "dark"
o.fillchars = { eob = " " }
o.shadafile = "NONE"
o.shadafile = ""
o.history = 10000
o.list = true
o.listchars = { tab = "» " }
o.pumheight = 7
o.splitbelow = true
o.splitright = true
