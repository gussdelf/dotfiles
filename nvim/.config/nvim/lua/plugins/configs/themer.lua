require("themer").setup {
	colorscheme = "gruvbox-material-dark-hard", -- default colorscheme
	transparent = false,
	term_colors = true,
	dim_inactive = false,
	styles = {
		heading = {
			h1 = {},
			h2 = {},
		},
		["function"] = { style = "italic" },
		functionBuiltIn = {},
		variable = {},
		variableBuiltIn = {},
		include = {},
		identifier = {},
		keyword = { style = "italic" },
		keywordBuiltIn = {},
		struct = {},
		string = { style = "bold" },
		parameter = {},
		field = {},
		type = {},
		typeBuiltIn = {},
		property = {},
		comment = {},
		punctuation = {},
		constructor = {},
		operator = {},
		constant = {},
		constantBuiltIn = {},
		todo = {},
		character = {},
		conditional = {},
		number = {},
		statement = {},
		uri = {},
		diagnostic = {
			underline = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
			virtual_text = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
		},
	},
	remaps = {
		palette = {},
		-- per colorscheme palette remaps, for example:
		-- remaps.palette = {
		--     rose_pine = {
		--     	fg = "#000000"
		--     }
		-- },
		-- remaps.highlights = {
		--     rose_pine = {
		--	base = {
		--     	  Normal = { bg = "#000000" }
		--	},
		--     }
		-- },
		--
		-- Also you can do remaps.highlights.globals  for global highlight remaps
		highlights = {},
	},

	langs = {
		html = true,
		md = true,
	},

	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
		telescope = true,
	},
}
