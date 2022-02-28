local g = vim.g

ColorGruv = function()
	g.gruvbox_material_palette = "original"
	g.gruvbox_material_enable_italic = true
	g.gruvbox_material_background = "hard"
	g.gruvbox_material_better_performance = true
	g.gruvbox_material_cursor = "red"
	g.gruvbox_material_sign_column_background = "none"
	g.gruvbox_material_transparent_background = true
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

ColorEdge = function()
	g.edge_style = "neon"
	g.edge_enable_italic = true
	g.edge_cursor = "red"
	g.edge_diagnostic_text_highlight = true
	g.edge_diagnostic_line_highlight = true

	vim.cmd [[ color edge]]

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

ColorGruv()
