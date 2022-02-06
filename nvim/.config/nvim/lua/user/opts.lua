-- Indent
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.preserveindent = true

-- I prefer tabs over spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Mouse
vim.opt.mouse = "a"

-- Undo
vim.opt.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.incsearch = true

-- Filetypes
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

-- Others
vim.opt.compatible = false
vim.opt.so = 5
vim.o.swapfile = false
vim.o.background = "dark"
vim.opt.fillchars = { eob = " " }
vim.opt.listchars = { tab = "••", trail = "•", extends = "»", precedes = "«" }
vim.opt.shadafile = "NONE"
vim.opt.shadafile = ""
vim.opt.history = 10000
