require("bufferline").setup {}

map("n", "<leader>bj", "<cmd>BufferLineCycleNext<CR>", { silent = true })
map("n", "<leader>bk", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
