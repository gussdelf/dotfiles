require("nvim-treesitter.configs").setup {
	ensure_installed = tsEnsureInstall,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
}
