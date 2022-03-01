local g = vim.g

ColorGruv = function(tbg)
	g.gruvbox_material_palette = "original"
	g.gruvbox_material_enable_italic = true
	g.gruvbox_material_background = "hard"
	g.gruvbox_material_better_performance = true
	g.gruvbox_material_cursor = "red"
	g.gruvbox_material_sign_column_background = "none"
	g.gruvbox_material_transparent_background = tbg
	g.gruvbox_material_diagnostic_text_highlight = true
	g.gruvbox_material_diagnostic_line_highlight = true
	vim.cmd [[colorscheme gruvbox-material]]
	vim.cmd [[
		hi default GHTextViewDark guifg=#e0d8f4
		hi default GHListDark guifg=#e0d8f4
		hi default GHListHl guifg=#e0d8f4 guibg=#282828
		hi SpecialKey guifg=#cc241d
		hi SpecialKeyWin guifg=#3c3836

		set winhighlight=SpecialKey:SpecialKeyWin
		" hi SignColumn guibg=#1d2021
		" hi LineNr guibg=#282828
	]]
end

ColorEdge = function(tbg)
	g.edge_style = "neon"
	g.edge_enable_italic = true
	g.edge_cursor = "red"
	g.edge_transparent_background = tbg
	g.edge_diagnostic_text_highlight = true
	g.edge_diagnostic_line_highlight = true

	vim.cmd [[ color edge]]

	vim.cmd [[
		hi default GHTextViewDark guifg=#e0d8f4
		hi default GHListDark guifg=#e0d8f4
		hi default GHListHl guifg=#e0d8f4 guibg=#282828
		hi SpecialKey guifg=#cc241d
		" hi SpecialKeyWin guifg=#3c3836

		" set winhighlight=SpecialKey:SpecialKeyWin
		" hi SignColumn guibg=#1d2021
		" hi LineNr guibg=#282828
	]]
end

ColorCat = function(tbg)
	require("catppuccin").setup {
		transparent_background = tbg,
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			cmp = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = false,
			telescope = true,
			nvimtree = {
				enabled = false,
				show_root = false,
				transparent_panel = false,
			},
			neotree = {
				enabled = false,
				show_root = false,
				transparent_panel = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = false,
			hop = true,
			notify = true,
			telekasten = true,
		},
	}
	vim.cmd [[ color catppuccin]]
end

ColorFox = function(transparent)
	require("nightfox").setup {
		fox = "nightfox",
		transparent = transparent,
		alt_nc = false,
		terminal_colors = true,
		styles = {
			comments = "italic",
			functions = "italic,bold",
			keywords = "bold",
		},
		inverse = {
			match_paren = true,
			visual = true,
			search = false,
		},
		colors = {},
		hlgroups = {},
	}
	require("nightfox").load()
end

ColorRose = function(tbg)
	require("rose-pine").setup {
		dark_variant = "main",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = tbg,
		disable_float_background = false,
		disable_italics = false,
		groups = {
			border = "highlight_med",
			comment = "muted",
			link = "iris",
			punctuation = "subtle",

			error = "love",
			hint = "iris",
			info = "foam",
			warn = "gold",

			headings = {
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		},
	}

	vim.cmd [[colorscheme rose-pine]]
end

ColorEdge(true)
