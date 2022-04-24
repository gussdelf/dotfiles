local o = vim.opt

-- Indent
o.smartindent = true

-- I prefer tabs over spaces
o.expandtab = false
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

vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"

-- o.foldmethod = "expr" -- use treesitter for folding
-- o.foldexpr = "nvim_treesitter#foldexpr()"

-- Others
o.formatoptions:remove { "c", "r", "o" }
o.compatible = false
o.so = 5
o.swapfile = false
o.shadafile = "NONE"
o.history = 10000
o.timeoutlen = 500
o.runtimepath = "$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after,$XDG_CONFIG_HOME/nvim/spell"
