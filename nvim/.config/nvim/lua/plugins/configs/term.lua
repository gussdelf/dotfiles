require("toggleterm").setup {
	open_mapping = [[<c-t>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	float_opts = {
		border = "curved",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })


function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { silent = true })