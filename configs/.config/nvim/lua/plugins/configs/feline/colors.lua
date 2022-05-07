local M = {}

M.gruvbox = {
	bg = "#1d2021",
	fg = "#ebdbb2",
	black = "#1d2021",
	skyblue = "#458588",
	cyan = "#83a598",
	green = "#98971a",
	oceanblue = "#83a598",
	magenta = "#fb4934",
	orange = "#d65d0e",
	red = "#cc241d",
	violet = "#d3869b",
	white = "#fbf1c7",
	yellow = "#d79921",
}

M.kanagawa = {
	bg = "#1F1F28",
	fg = "#DCD7BA",
	black = "#090618",
	skyblue = "#7E9CD8",
	cyan = "#6A9589",
	green = "#76946A",
	oceanblue = "#7FB4CA",
	magenta = "#C34043",
	orange = "#FFA066",
	red = "#E82424",
	violet = "#938AA9",
	white = "#DCD7BA",
	yellow = "#E6C384",
}

M.nord = {
	bg = "#2E3440",
	bg_dk = "#222730",
	fg = "#D8DEE9",
	black = "#3B4252",
	skyblue = "#5E81AC",
	cyan = "#8FBCBB",
	green = "#A3BE8C",
	oceanblue = "#88C0D0",
	magenta = "#BF616A",
	orange = "#D08770",
	red = "#BF616A",
	violet = "#B48EAD",
	white = "#ECEFF4",
	yellow = "#EBCB8B",
}

M.edge = {
	bg = "#2b2d3a",
	fg = "#c5cdd9",
	black = "#2b2d3a",
	skyblue = "#6cb6eb",
	cyan = "#5dbbc1",
	green = "#a0c980",
	oceanblue = "#5dbbc1",
	magenta = "#d38aea",
	orange = "#deb974",
	red = "#ec7279",
	violet = "#d38aea",
	white = "#c5cdd9",
	yellow = "#deb974",
}

M.vscode = {
	bg = "#1e1e1e",
	fg = "#d4d4d4",
	black = "#1e1e1e",
	skyblue = "#339CDB",
	cyan = "#35CDAF",
	green = "#579C4C",
	oceanblue = "#35CDAF",
	magenta = "#d4d4d4",
	orange = "#d47676",
	red = "#d47676",
	violet = "#d4d4d4",
	white = "#d4d4d4",
	yellow = "#D9DAA2",
}

M.tokyonight = {
	bg = "#1a1b26",
	fg = "#c0caf5",
	black = "#15161E",
	skyblue = "#7aa2f7",
	cyan = "#7dcfff",
	green = "#9ece6a",
	oceanblue = "#7aa2f7",
	magenta = "#bb9af7",
	orange = "#e0af68",
	red = "#f7768e",
	violet = "#bb9af7",
	white = "#c0caf5",
	yellow = "#e0af68",
}

M.colorsheme = function(theme)
	local pallete = {
		bg = require("plugins.configs.feline.colors")[theme].bg,
		fg = require("plugins.configs.feline.colors")[theme].fg,
		black = require("plugins.configs.feline.colors")[theme].black,
		skyblue = require("plugins.configs.feline.colors")[theme].skyblue,
		cyan = require("plugins.configs.feline.colors")[theme].cyan,
		green = require("plugins.configs.feline.colors")[theme].green,
		oceanblue = require("plugins.configs.feline.colors")[theme].oceanblue,
		magenta = require("plugins.configs.feline.colors")[theme].magenta,
		orange = require("plugins.configs.feline.colors")[theme].orange,
		red = require("plugins.configs.feline.colors")[theme].red,
		violet = require("plugins.configs.feline.colors")[theme].violet,
		white = require("plugins.configs.feline.colors")[theme].white,
		yellow = require("plugins.configs.feline.colors")[theme].yellow,
	}
	return pallete
end

return M
