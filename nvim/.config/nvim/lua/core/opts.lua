vim.o.clipboard = 'unnamedplus'
vim.o.hidden = false
vim.o.completeopt = 'menu','menuone','noselect'

if vim.g.gnvim then
	vim.cmd [[ set guifont=FiraCodeNerdFont:h12 ]]
end
