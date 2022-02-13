require "plugins.configs.feline.colors"
local u = require "plugins.configs.feline.util"

local function vi_mode_hl()
	return u.vi.colors[vim.fn.mode()] or "FlnViBlack"
end

local function vi_sep_hl()
	return u.vi.sep[vim.fn.mode()] or "FlnBlack"
end

local c = {
	vimode = {
		provider = function()
			return string.format(" %s ", u.vi.text[vim.fn.mode()])
		end,
		hl = vi_mode_hl,
		right_sep = { str = u.icons.right_filled, hl = vi_sep_hl },
	},
}

local active = {
	{
		c.vimode,
	},
}

require("feline").setup {
	components = { active = active },
}
