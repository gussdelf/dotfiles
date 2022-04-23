local o = vim.opt

-- Termguicolors
o.termguicolors = true

-- Numbers
o.number = true
o.relativenumber = true

-- Cursorline
o.cursorline = true

-- Highlight on yank
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Disable numbers on terminal
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.filetype = "terminal"
	end,
})

-- Chars
o.fillchars = { eob = " " }
-- o.listchars = { tab = "» " }
-- o.list = true

-- signcolumn
o.signcolumn = "yes"

-- Global statusline
vim.opt.laststatus = 3

-- Others
o.showmode = false
-- o.guicursor = "n-i:blinkon100,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
o.guicursor = "a:block"
o.background = "dark"
o.pumheight = 7
o.splitbelow = true
o.splitright = true
