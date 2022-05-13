local g = vim.g

function Colorscheme(name)
	vim.g.colors_name = name
	vim.o.background = vim.o.background
end

ColorGruv = function(style, tbg)
	g.gruvbox_material_palette = style
	g.gruvbox_material_sign_column_background = "none"
	g.gruvbox_material_background = "hard"
	g.gruvbox_material_transparent_background = tbg
	g.gruvbox_material_enable_italic = true
	g.gruvbox_material_better_performance = true
	g.gruvbox_material_diagnostic_line_highlight = true
	-- g.gruvbox_material_diagnostic_text_highlight = true
	Colorscheme "gruvbox-material"
	vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })
	vim.api.nvim_set_hl(0, "SpecialKey", { link = "red" })
	vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "blue" })
	vim.api.nvim_set_hl(0, "MarkSignHl", { link = "red" })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Search" })
	vim.api.nvim_set_hl(0, "TSProperty", { italic = true })
	vim.api.nvim_set_hl(0, "TSVariable", { italic = true })
	vim.api.nvim_set_hl(0, "TSBoolean", { italic = true })
	vim.api.nvim_set_hl(0, "TSTypeBuiltin", { bold = false, italic = false, underline = false, undercurl = false })
	vim.api.nvim_set_hl(0, "SpecialKeyWin", { fg = "#3c3836" })
	vim.api.nvim_set_hl(0, "GHTextViewDark", { bg = "NONE", fg = "NONE" })
	vim.api.nvim_set_hl(0, "GHListDark", { bg = "NONE", fg = "NONE" })
	vim.cmd [[
		set winhighlight=SpecialKey:SpecialKeyWin
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
	Colorscheme "kanagawa"
	vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })
	vim.api.nvim_set_hl(0, "SpecialKey", { link = "red" })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Search" })
	vim.api.nvim_set_hl(0, "GHTextViewDark", { bg = "NONE", fg = "NONE" })
	vim.api.nvim_set_hl(0, "GHListDark", { bg = "NONE", fg = "NONE" })
end

ColorNord = function(tbg)
	-- Example config in lua
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_disable_background = tbg
	vim.g.nord_italic = true

	-- Load the colorscheme

	require("nord").set()

	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#222730" })
	vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })
	vim.api.nvim_set_hl(0, "MarkSignHl", { link = "red" })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Search" })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "CursorLine" })
	vim.api.nvim_set_hl(0, "TSField", { link = "TSFuncBuiltin" })
	vim.api.nvim_set_hl(0, "TSVariable", { italic = true })
	vim.api.nvim_set_hl(0, "TSProperty", { italic = true })
	vim.api.nvim_set_hl(0, "TSTypeBuiltin", { bold = false, italic = false, underline = false, undercurl = false })
	vim.api.nvim_set_hl(0, "TSBoolean", { bold = true })
	vim.api.nvim_set_hl(0, "TSString", { italic = false, fg = "#A3BE8C" })
	vim.api.nvim_set_hl(0, "GHTextViewDark", { bg = "NONE", fg = "NONE" })
	vim.api.nvim_set_hl(0, "GHListDark", { bg = "NONE", fg = "NONE" })
end

ColorTokyo = function(style, tbg)
	vim.g.tokyonight_transparent = tbg
	vim.g.tokyonight_style = style
	vim.cmd [[ color tokyonight ]]
	Colorscheme "tokyonight"
	vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Search" })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "CursorLine" })
	vim.api.nvim_set_hl(0, "TSField", { link = "TSFuncBuiltin" })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", fg = "NONE" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "TSVariable", { italic = true })
	vim.api.nvim_set_hl(0, "TSProperty", { italic = true })
	vim.api.nvim_set_hl(0, "TSBoolean", { bold = true })
	vim.api.nvim_set_hl(0, "GHTextViewDark", { bg = "NONE", fg = "NONE" })
	vim.api.nvim_set_hl(0, "GHListDark", { bg = "NONE", fg = "NONE" })
end

ColorGruv "original"
