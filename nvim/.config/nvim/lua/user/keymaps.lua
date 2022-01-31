-- Mapleader to space
vim.g.mapleader = " "

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
