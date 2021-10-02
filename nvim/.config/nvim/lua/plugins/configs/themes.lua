-- NeoSolarized
vim.g.neosolarized_bold = 1
vim.g.neosolarized_underline = 1
vim.g.neosolarized_italic = 1

if vim.g.gnvim then
else 
  vim.g.neosolarized_termtrans = 1
end

-- Tokyonight
vim.g.tokyonight_style = "day"
vim.g.tokyonight_day_brightness	 = 0.1
vim.g.tokyonight_hide_inactive_statusline = true	
vim.g.tokyonight_italic_comments = true	
vim.g.tokyonight_italic_keywords = true	
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_lualine_bold = true

-- Material
require('material').setup({

	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders = false, -- Enable borders between verticaly split windows

	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings = true, -- Enable italic strings
		variables = false -- Enable italic variables
	},

	contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf" -- Darker qf list background
	},

	text_contrast = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},

	disable = {
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	}
})
vim.g.material_style = "palenight"

-- Onedark
vim.g.onedark_style = 'cool'
--require('onedark').setup()

-- Calvera
vim.g.calvera_italic_keywords = true
vim.g.calvera_italic_comments = true
vim.g.calvera_italic_functions = true
vim.g.calvera_borders = true
vim.g.calvera_contrast = true
vim.g.calvera_hide_eob = true
--vim.g.calvera_custom_colors = {contrast = "#0f111a"}
--require('tokyonight').set()

-- Set colorscheme
vim.cmd [[ colorscheme NeoSolarized ]]
