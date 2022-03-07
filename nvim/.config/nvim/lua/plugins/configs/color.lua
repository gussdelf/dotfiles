local g = vim.g

ColorOne = function(tbg)
	require("onedarkpro").setup {
		theme = function()
			if vim.o.background == "dark" then
				return "onedark"
			else
				return "onelight"
			end
		end,
		colors = {
			onedark = {
				-- Vivid colors from https://github.com/Binaryify/OneDark-Pro
				red = "#ef596f",
				green = "#89ca78",
				cyan = "#2bbac5",
				purple = "#d55fde",
			},
		},
		hlgroups = {
			TelescopeMatching = { style = "underline" },
			MatchParen = { style = "underline" },
		},
		filetype_hlgroups = {},
		plugins = {
			all = false,
			native_lsp = true,
			treesitter = true,
			telescope = true,
			hop = true,
			nvim_cmp = true,
			trouble_nvim = true,
			packer = true,
			toggleterm = true,
		},
		styles = {
			strings = "italic",
			comments = "italic",
			keywords = "bold,italic",
			functions = "italic",
		},
		options = {
			bold = true,
			italic = true,
			underline = false,
			undercurl = false,
			cursorline = false,
			transparency = tbg,
			terminal_colors = true,
			window_unfocussed_color = false,
		},
	}
	require("onedarkpro").load()
end

ColorMatGruv = function(tbg)
	g.gruvbox_material_background = "hard"
	g.gruvbox_material_palette = "original"
	g.gruvbox_material_sign_column_background = "none"
	g.gruvbox_material_transparent_background = tbg
	g.gruvbox_material_enable_italic = true
	g.gruvbox_material_better_performance = true
	g.gruvbox_material_diagnostic_text_highlight = true
	g.gruvbox_material_diagnostic_line_highlight = true
	vim.cmd [[ color gruvbox-material ]]
	vim.cmd [[
		hi default GHTextViewDark guifg=#e0d8f4
		hi default GHListDark guifg=#e0d8f4
		hi default GHListHl guifg=#e0d8f4 guibg=#282828
		hi SpecialKey guifg=#cc241d
		hi SpecialKeyWin guifg=#3c3836
		set winhighlight=SpecialKey:SpecialKeyWin
		hi MatchParen gui=underline
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

ColorFox = function(tbg)
	require("nightfox").setup {
		fox = "nordfox",
		transparent = tbg,
		alt_nc = false,
		terminal_colors = true,
		styles = {
			comments = "italic",
			strings = "italic",
			functions = "italic,bold",
			keywords = "bold",
			-- variables = "",
		},
		inverse = {
			match_paren = true,
			visual = true,
			search = false,
		},
		colors = {},
		hlgroups = {
			TelescopeMatching = { style = "underline" },
			MatchParen = { style = "underline" },
		},
	}
	require("nightfox").load()
end

ColorKana = function(tng)
	-- Default options:
	require("kanagawa").setup {
		undercurl = true,
		commentStyle = "italic",
		functionStyle = "italic",
		keywordStyle = "italic",
		statementStyle = "bold",
		typeStyle = "italic",
		variablebuiltinStyle = "italic",
		specialReturn = true,
		specialException = true,
		dimInactive = false,
		transparent = tng,
	}

	-- setup must be called before loading
	vim.cmd [[ colorscheme kanagawa ]]
	vim.cmd [[ hi MatchParen gui=underline ]]
end

ColorMatGruv(true)
