require("toggleterm").setup {
	open_mapping = [[<c-t>]],
	hide_numbers = true,
	shade_terminals = false,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

local function _lazygit_toggle()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>lz", function()
	_lazygit_toggle()
end, { silent = true })
