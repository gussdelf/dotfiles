local o = vim.opt
-- Termguicolors
o.termguicolors = true

-- Numbers
o.number = true
o.relativenumber = true

-- Cursorline
o.cursorline = true

vim.api.nvim_create_augroup { name = "YankHighlight", clear = true }
vim.api.nvim_create_autocmd {
	group = "YankHighlight",
	event = "TextYankPost",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
}

-- Chars
o.fillchars = { eob = " " }
o.listchars = { tab = "» " }

-- signcolumn
o.signcolumn = "yes"

-- Others
o.showmode = false
o.guicursor = "n-i:blinkon100,v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
o.background = "dark"
o.list = true
o.pumheight = 7
o.splitbelow = true
o.splitright = true
