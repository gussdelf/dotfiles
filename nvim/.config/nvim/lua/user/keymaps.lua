-- Mapleader to space
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window managment
vim.keymap.set("n", "<leader>q", "<cmd>bw<cr>", { silent = true }) -- Close buffer
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<cr>", { silent = true }) -- Window down
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<cr>", { silent = true }) -- Window up
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<cr>", { silent = true }) -- Window right
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<cr>", { silent = true }) -- Window left
vim.keymap.set("n", "<leader>ww", "<cmd>vsplit<cr> <C-w>l", { silent = true }) -- Vertical split window

-- Buffer
vim.keymap.set("n", "<leader>bj", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bk", "<cmd>bprevious<CR>", { silent = true })

-- Moviment
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set("v", "j", "gj", { silent = true })
vim.keymap.set("v", "k", "gk", { silent = true })
vim.keymap.set("n", "H", "0", { silent = true })
vim.keymap.set("n", "L", "$", { silent = true })

-- File
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { silent = true })

-- others
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<C-c>", ":noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "ç", ":", { silent = false })
