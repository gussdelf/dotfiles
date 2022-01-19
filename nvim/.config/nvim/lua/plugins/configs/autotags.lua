-- Autotag
require("nvim-treesitter.configs").setup {
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"svelte",
			"vue",
		},
	},
}
