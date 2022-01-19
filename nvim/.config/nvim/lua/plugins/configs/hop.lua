require("hop").setup()

-- Mapping
map("n", "f", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
map("n", "F", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
map("v", "f", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
map("v", "F", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
map("o", "f", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
map("o", "F", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
