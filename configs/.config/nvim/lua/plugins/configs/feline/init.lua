-- A initial comment

local colors = require "plugins.configs.feline.colors"
local lsp = require "feline.providers.lsp"

local vi_mode_colors = {
	NORMAL = colors.gruvbox.green,
	INSERT = colors.gruvbox.oceanblue,
	VISUAl = colors.gruvbox.oceanblue,
	LINES = colors.gruvbox.oceanblue,
	OP = colors.gruvbox.green,
	BLOCK = colors.gruvbox.oceanblue,
	REPLACE = colors.gruvbox.red,
	["V-REPLACE"] = colors.gruvbox.red,
	ENTER = colors.gruvbox.cyan,
	MORE = colors.gruvbox.cyan,
	SELECT = colors.gruvbox.orange,
	COMMAND = colors.gruvbox.magenta,
	SHELL = colors.gruvbox.green,
	TERM = colors.gruvbox.oceanblue,
	NONE = colors.gruvbox.yellow,
}

local vi_mode_text = {
	["n"] = "NORMAL",
	["no"] = "OP",
	["nov"] = "OP",
	["noV"] = "OP",
	["no"] = "OP",
	["niI"] = "NORMAL",
	["niR"] = "NORMAL",
	["niV"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "LINES",
	[""] = "BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT",
	[""] = "BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["ix"] = "INSERT",
	["R"] = "REPLACE",
	["Rc"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["Rx"] = "REPLACE",
	["c"] = "COMMAND",
	["cv"] = "COMMAND",
	["ce"] = "COMMAND",
	["r"] = "ENTER",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERM",
	["nt"] = "TERM",
	["null"] = "NONE",
}

local components = {
	active = {},
	inactive = {},
}

-- Left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- Left and right inactive session
table.insert(components.inactive, {})
table.insert(components.inactive, {})

components.active[1] = {
	{
		provider = "▊ ",
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
			}
		end,
	},
	{
		provider = function()
			local current_text = "" .. vi_mode_text[vim.fn.mode()] .. " "
			return current_text
		end,
		hl = function()
			return {
				name = require("feline.providers.vi_mode").get_mode_highlight_name(),
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = colors.gruvbox.bg,
				style = "bold",
			}
		end,
		str = " ",
	},
	{
		provider = "file_info",
		hl = {
			fg = colors.gruvbox.oceanblue,
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	{
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist "Error"
		end,
		hl = {
			fg = colors.gruvbox.red,
		},
	},
	{
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist "Warn"
		end,
		hl = {
			fg = colors.gruvbox.yellow,
		},
	},
	{
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist "Hint"
		end,
		hl = {
			fg = colors.gruvbox.cyan,
		},
	},
	{
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist "Info"
		end,
		hl = {
			fg = colors.gruvbox.oceanblue,
		},
	},
}

components.active[3] = {
	{
		provider = "file_type",
		hl = {
			fg = colors.gruvbox.violet,
		},
		right_sep = " ",
	},
	-- Git
	{
		provider = "git_diff_added",
		hl = {
			fg = colors.gruvbox.green,
		},
		right_sep = " ",
	},
	{
		provider = "git_diff_changed",
		hl = {
			fg = colors.gruvbox.orange,
		},
		right_sep = " ",
	},
	{
		provider = "git_diff_removed",
		hl = {
			fg = colors.gruvbox.red,
		},
		right_sep = " ",
	},
	{
		provider = "git_branch",
		hl = {
			fg = colors.gruvbox.violet,
			style = "bold",
		},
		right_sep = " ",
	},

	{
		provider = " ▊",
		hl = function()
			return {
				fg = colors.gruvbox.green,
			}
		end,
	},
}

require("feline").setup {
	components = components,
	vi_mode_colors = vi_mode_colors,
	theme = {
		bg = colors.gruvbox.bg,
		fg = colors.gruvbox.fg,
	},
}
