-- Mapleader to space
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window managment
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<cr>", { silent = true }) -- Window down
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<cr>", { silent = true }) -- Window up
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<cr>", { silent = true }) -- Window right
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<cr>", { silent = true }) -- Window left
vim.keymap.set("n", "<leader>ww", "<cmd>wincmd w<cr>", { silent = true }) -- Window alternatve

vim.keymap.set("n", "<leader>wJ", "<cmd>wincmd J<cr>", { silent = true }) -- Move window down
vim.keymap.set("n", "<leader>wK", "<cmd>wincmd K<cr>", { silent = true }) -- Move window up
vim.keymap.set("n", "<leader>wL", "<cmd>wincmd L<cr>", { silent = true }) -- Move window right
vim.keymap.set("n", "<leader>wH", "<cmd>wincmd H<cr>", { silent = true }) -- Move window left

vim.keymap.set("n", "<leader>wt", "<cmd>wincmd T<cr>", { silent = true }) -- Move window to a new tab
vim.keymap.set("n", "<leader>wx", "<cmd>wincmd x<cr>", { silent = true }) -- Swap window

vim.keymap.set("n", "<leader>w=", "<cmd>wincmd =<cr>", { silent = true }) -- Make window equally
vim.keymap.set("n", "<leader>w+", "<cmd>wincmd +<cr>", { silent = true }) -- Increase current window
vim.keymap.set("n", "<leader>w-", "<cmd>wincmd -<cr>", { silent = true }) -- Decrease current window

vim.keymap.set("n", "<leader>wv", "<cmd>vsplit | wincmd h<cr>", { silent = true }) -- Vertical split window
vim.keymap.set("n", "<leader>ws", "<cmd>split | wincmd j<cr>", { silent = true }) -- Horizontal split window
vim.keymap.set("n", "<leader>wq", "<cmd>close<cr>", { silent = true }) -- Close split window

-- Buffer
vim.keymap.set("n", "<leader>bj", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bk", "<cmd>bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>bw<cr>", { silent = true }) -- Close buffer

-- g remaps
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "0", "v:count == 0 ? 'g0' : '0'", { noremap = true, expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "$", "v:count == 0 ? 'g$' : '$'", { noremap = true, expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "Q", "gqq", { noremap = true, silent = true })

-- No register rewrite
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, ",d", "d", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ",D", "D", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ",c", "c", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ",C", "C", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ",x", "x", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ",X", "X", { noremap = true, silent = true })

-- Insert mode moviment
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true, silent = true })

-- File
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { silent = true })

-- I don't like press 2 buttons to enter in the cmd mode.
vim.keymap.set({ "n", "v" }, "ç", ":", { silent = false })
vim.keymap.set({ "n", "v" }, ";", ":", { silent = false })

-- others
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { silent = true })
