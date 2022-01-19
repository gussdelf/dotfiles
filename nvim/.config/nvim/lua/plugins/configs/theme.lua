function setThemeEverforest()
	vim.g.everforest_background = "hard"
	vim.cmd [[colorscheme everforest]]
	vim.cmd [[hi! EndOfBuffer guibg=bg guifg=bg]]
end

function setThemeCodeDark()
	vim.cmd [[colorscheme codedark]]
	vim.cmd [[hi! EndOfBuffer guibg=bg guifg=bg]]
end

function setThemeNord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_disable_background = false
	vim.g.nord_italic = true
	require("nord").set()
	vim.cmd [[hi! EndOfBuffer guibg=bg guifg=bg]]
end

setThemeNord()
