local g = vim.g

ColorMatGruv = function(tbg)
	g.gruvbox_material_palette = "original"
	g.gruvbox_material_sign_column_background = "none"
	g.gruvbox_material_background = "hard"
	g.gruvbox_material_transparent_background = tbg
	g.gruvbox_material_enable_italic = true
	g.gruvbox_material_better_performance = true
	g.gruvbox_material_diagnostic_line_highlight = true
	-- g.gruvbox_material_diagnostic_text_highlight = true
	vim.cmd [[ color gruvbox-material ]]
	vim.cmd [[
		hi! link MatchParen Search
		hi! link SpecialKey red
		hi! link MarkSignHl red
		hi! link TelescopeMatching Search
		hi TSVariable gui=italic
		hi TSProperty gui=italic
		hi TSTypeBuiltin gui=none
		hi SpecialKeyWin guifg=#3c3836
		set winhighlight=SpecialKey:SpecialKeyWin
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
		hi! link MatchParen Search
		hi! link SpecialKey red
		hi! link TelescopeMatching Search
	]]
end

ColorKana = function(tbg)
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
		hi! link MatchParen Search
		hi! link TelescopeMatching Search
	]]
end

ColorCode = function(tbg)
	g.vscode_style = "dark"
	g.vscode_transparent = tbg
	g.vscode_italic_comment = 1
	g.vscode_disable_nvimtree_bg = true
	vim.cmd [[ color vscode ]]
	vim.cmd [[
		hi! link MatchParen Search
		hi! link TelescopeMatching Search
		hi TSVariable gui=italic
		hi TSProperty gui=italic
		hi TSTypeBuiltin gui=none
	]]
end

ColorNord = function(tbg)
	-- Example config in lua
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_disable_background = tbg
	vim.g.nord_italic = true

	-- Load the colorscheme

	require("nord").set()

	vim.cmd [[
		hi! link MatchParen Search
		hi! link TSField TSFuncBuiltin
		hi! link TelescopeMatching Search
		hi! link TelescopeSelection CursorLine
		hi TSVariable gui=italic
		hi TSProperty gui=italic
		hi TSTypeBuiltin gui=none
		hi TSString gui=none
	]]
end

ColorTokyo = function(style, tbg)
	vim.g.tokyonight_transparent = tbg
	vim.g.tokyonight_style = style
	vim.cmd [[ color tokyonight ]]
	vim.cmd [[
		hi! link MatchParen Search
		hi! link TSField TSFuncBuiltin
		hi! link TelescopeMatching Search
		hi! link TelescopeSelection CursorLine
		hi TelescopeNormal guibg=NONE guifg=NONE
		hi TelescopeBorder guibg=NONE 
		hi TSVariable gui=italic
		hi TSProperty gui=italic
	]]
end

ColorMatGruv()
