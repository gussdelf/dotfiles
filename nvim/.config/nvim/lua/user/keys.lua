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

M.lspconfig = function()
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true})
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true})
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true})
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { silent = true})
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { silent = true})
  map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { silent = true})
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true})
  map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true})
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true})
  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true})
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true})
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true})
  map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { silent = true})
  map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { silent = true})
end

M.telescope = function()
	map("n", "<leader><leader>", "<cmd>Telescope<cr>", { silent = true })
	map("n", "<leader>bb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })
	map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent = true })
	map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').filetypes()<cr>", { silent = true })
	map("n", "<leader>j", "<cmd>lua require('telescope').extensions.zoxide.list()<cr>", { silent = true })
	map("n", "<leader>fd", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", { silent = true })
	map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { silent = true })
	map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })
	map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { silent = true })
	map("n", "<leader>cc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", { silent = true })
	map("n", "<leader>is", "<cmd>lua require('telescope.builtin').symbols()<cr>", { silent = true })
	map(
		"n",
		"<leader>ss",
		"<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case previewer=false<cr>",
		{ silent = true }
	)
end

M.bufferline = function()
	map("n", "<leader>bj", "<cmd>BufferLineCycleNext<CR>", { silent = true })
	map("n", "<leader>bk", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
end

M.colorizer = function()
	map("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { silent = true })
end

M.hop = function()
	-- Mapping
	map("n", "F", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
	map("n", "f", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
	map("v", "F", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
	map("v", "f", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
	map("o", "F", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
	map("o", "f", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
end

M.neoformat = function()
	map("n", "<C-f>", "<cmd>Neoformat<cr>", { silent = true })
end

return M
