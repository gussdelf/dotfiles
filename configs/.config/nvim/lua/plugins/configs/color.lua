local g = vim.g

ColorMatGruv = function(tbg)
	g.gruvbox_material_background = "hard"
	g.gruvbox_material_palette = "original"
	g.gruvbox_material_sign_column_background = "none"
	g.gruvbox_material_transparent_background = tbg
	g.gruvbox_material_enable_italic = true
	g.gruvbox_material_better_performance = true
	g.gruvbox_material_diagnostic_line_highlight = true
	-- g.gruvbox_material_diagnostic_text_highlight = true
	vim.cmd [[ color gruvbox-material ]]
	vim.cmd [[
		hi SpecialKey guifg=#cc241d
		hi SpecialKeyWin guifg=#3c3836
		set winhighlight=SpecialKey:SpecialKeyWin
		hi MatchParen gui=underline
		hi TelescopeMatching guibg=#b8bb26 guifg=#1d2021
		" hi TelescopeSelection guifg=#fe8019
		hi MarkSignHl guifg=#cc241d
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
		hi SpecialKey guifg=#cc241d
		hi TelescopeMatching guibg=#a0c980 guifg=#2b2d3a
		" hi SpecialKeyWin guifg=#3c3836

		" set winhighlight=SpecialKey:SpecialKeyWin
		" hi SignColumn guibg=#1d2021
		" hi LineNr guibg=#282828
	]]
end

ColorKana = function(tbg)
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
		transparent = tbg,
	}

	-- setup must be called before loading
	vim.cmd [[ color kanagawa ]]
	vim.cmd [[
		hi MatchParen gui=underline 
		hi TelescopeMatching guibg=#2D4F67 guifg=#DCD7BA
	]]
end

ColorCode = function(tbg)
	vim.g.vscode_style = "dark"
	vim.g.vscode_transparent = tbg
	vim.g.vscode_italic_comment = 1
	vim.g.vscode_disable_nvimtree_bg = true
	vim.cmd [[ color vscode ]]
end

ColorMatGruv(true)
