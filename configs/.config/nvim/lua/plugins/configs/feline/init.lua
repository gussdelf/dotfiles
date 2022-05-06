local colors_name = function()
	if vim.g.colors_name == "gruvbox-material" then
		return "gruvbox"
	else
		return vim.g.colors_name
	end
end

local colors = require("plugins.configs.feline.colors").colorsheme(colors_name())
local utils = require "plugins.configs.feline.utils"
local lsp = require "feline.providers.lsp"

local vi_mode_colors = {
	NORMAL = colors.green,
	INSERT = colors.oceanblue,
	VISUAl = colors.oceanblue,
	LINES = colors.oceanblue,
	OP = colors.green,
	BLOCK = colors.oceanblue,
	REPLACE = colors.red,
	["V-REPLACE"] = colors.red,
	ENTER = colors.cyan,
	MORE = colors.cyan,
	SELECT = colors.orange,
	COMMAND = colors.magenta,
	SHELL = colors.green,
	TERM = colors.oceanblue,
	NONE = colors.yellow,
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
				-- fg = colors.oceanblue,
				fg = require("feline.providers.vi_mode").get_mode_color(),
			}
		end,
	},
	{
		provider = " ",
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
			}
		end,
	},
	{
		provider = "file_size",
		right_sep = " ",
		left_sep = " ",
	},
	{
		provider = "file_info",
		hl = {
			fg = colors.oceanblue,
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	{
		provider = "position",
		left_sep = " ",
		right_sep = " ",
	},
	{
		provider = "line_percentage",
		right_sep = " ",
	},
	{
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist "Error"
		end,
		hl = {
			fg = colors.red,
		},
		icon = " ",
		right_sep = " ",
	},
	{
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist "Warn"
		end,
		hl = {
			fg = colors.yellow,
		},
		icon = " ",
		right_sep = " ",
	},
	{
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist "Hint"
		end,
		hl = {
			fg = colors.cyan,
		},
	},
	{
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist "Info"
		end,
		hl = {
			fg = colors.oceanblue,
		},
	},
}

components.active[2] = {
	{
		provider = function()
			local Lsp = vim.lsp.util.get_progress_messages()[1]
			if Lsp then
				local msg = Lsp.message or ""
				local percentage = Lsp.percentage or 0
				local title = Lsp.title or ""
				local spinners = {
					"",
					"",
					"",
				}
				local success_icon = {
					"",
					"",
					"",
				}
				local ms = vim.loop.hrtime() / 1000000
				local frame = math.floor(ms / 120) % #spinners
				if percentage >= 70 then
					return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
				end
				return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
			end
			return ""
		end,
		hl = {
			fg = colors.green,
		},
	},
}

components.active[3] = {
	{
		provider = "file_encoding",
		hl = {
			fg = colors.oceanblue,
		},
		right_sep = "  ",
	},
	{
		provider = "file_type",
		hl = {
			fg = colors.yellow,
			style = "bold",
		},
		right_sep = "  ",
	},
	{
		provider = utils.file_osinfo,
		hl = {
			fg = colors.oceanblue,
		},
		right_sep = "  ",
	},
	-- Git
	{
		provider = "git_branch",
		hl = {
			fg = colors.red,
			style = "bold",
		},
		icon = " ",
		right_sep = " ",
	},
	{
		provider = "git_diff_added",
		hl = {
			fg = colors.green,
		},
		right_sep = " ",
	},
	{
		provider = "git_diff_changed",
		hl = {
			fg = colors.orange,
		},
		right_sep = " ",
	},
	{
		provider = "git_diff_removed",
		hl = {
			fg = colors.red,
		},
		right_sep = " ",
	},
	{
		provider = " ▊",
		hl = {
			fg = colors.oceanblue,
		},
	},
}

require("feline").setup {
	components = components,
	vi_mode_colors = vi_mode_colors,
	theme = {
		bg = "NONE",
		fg = colors.fg,
	},
}

vim.api.nvim_create_augroup("SourceFeline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "SourceFeline",
	pattern = "*",
	command = "source ~/.config/nvim/lua/plugins/configs/feline/init.lua",
})
