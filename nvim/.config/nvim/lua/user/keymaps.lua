-- Mapleader to space
vim.g.mapleader = " "

-- Window managment
vim.keymap.set("n", "<leader>q", "<cmd>bw<cr>", { silent = true }) -- Close buffer
vim.keymap.set("n", "<leader>wj", "<C-w>j", { silent = true }) -- Window down
vim.keymap.set("n", "<leader>wk", "<C-w>k", { silent = true }) -- Window up
vim.keymap.set("n", "<leader>wl", "<C-w>l", { silent = true }) -- Window right
vim.keymap.set("n", "<leader>wh", "<C-w>h", { silent = true }) -- Window left
vim.keymap.set("n", "<leader>ww", "<cmd>vsplit<cr> <C-w>l", { silent = true }) -- Vertical split window

-- Moviment
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("v", "j", "gj", { silent = true })
vim.keymap.set("v", "k", "gk", { silent = true })
vim.keymap.set("n", "H", "0", { silent = true })
vim.keymap.set("n", "L", "$", { silent = true })

-- Files
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { silent = true }) -- Save file

-- others
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "ç", ":", { silent = false })
