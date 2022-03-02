require("startup").setup {
	theme = "startify",
	options = {
		disable_statuslines = true,
	},
}

vim.g.startup_bookmarks = {
	["P"] = "~/.config/nvim/lua/plugins/init.lua",
	["T"] = "~/.config/nvim/lua/plugins/configs/telescope.lua",
}
