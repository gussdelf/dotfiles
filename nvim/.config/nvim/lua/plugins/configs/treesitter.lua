require("nvim-treesitter.configs").setup {
	ensure_installed = { "javascript", "typescript", "fish", "bash", "rust", "c", "cpp", "tsx" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
}
