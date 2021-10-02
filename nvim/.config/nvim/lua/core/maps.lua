local utils = require('core.utils')

vim.g.mapleader = ' '

utils.map('n', '<Esc>', '<cmd>noh<CR>')
utils.map('i', 'jk', '<Esc>')
utils.map('n', ' s', '/')
utils.map('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>')
utils.map('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
utils.map('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>')
utils.map('n', '<leader>c', '<Cmd>Telescope colorscheme<CR>')
utils.map('n', '<leader>b', '<Cmd>Telescope buffers<CR>')
utils.map('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>')
utils.map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
utils.map('n', '<C-j>', '<Cmd>Lspsaga signature_help<CR>')
utils.map('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
