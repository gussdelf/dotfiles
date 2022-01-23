-- Mapleader to space
vim.g.mapleader = " "

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Window managment
map("n", "<leader>wq", "<cmd>bw<cr>", { silent = true }) -- Close buffer
map("n", "<leader>wj", "<C-w>j", { silent = true }) -- Window down
map("n", "<leader>wk", "<C-w>k", { silent = true }) -- Window up
map("n", "<leader>wl", "<C-w>l", { silent = true }) -- Window right
map("n", "<leader>wh", "<C-w>h", { silent = true }) -- Window left
map("n", "<leader>ww", "<cmd>vsplit<cr> <C-w>l", { silent = true }) -- Vertical split window

-- Moviment
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })
map("v", "j", "gj", { silent = true })
map("v", "k", "gk", { silent = true })
map("n", "H", "0", { silent = true })
map("n", "L", "$", { silent = true })

-- Files
map("n", "<leader>fs", "<cmd>w<cr>", { silent = true }) -- Save file

-- others
map("n", "<Esc>", ":noh<CR>", { silent = true })
map("n", "ç", ":", { silent = false })

-- Plugins mappings
--
local M = {}

M.lspconfig = function() end

M.hop = function() end

M.neoformat = function() end

return M
