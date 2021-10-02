-- Packer session
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- The own packer.nvim
	use 'wbthomason/packer.nvim'
	-- The themes
	use{
		'overcache/NeoSolarized',
		config = function()
			require('plugins.configs.themes')
		end,
	}
	use {
		'folke/tokyonight.nvim',
		config = function()
			require('plugins.configs.themes')
		end
	}
	use {
		'marko-cerovac/material.nvim',
		config = function()
			require('plugins.configs.themes')
		end
	}
	use{
		'navarasu/onedark.nvim',
		config = function()
			require('plugins.configs.themes')
		end,
	}
	use{
		'yashguptaz/calvera-dark.nvim',
		config = function()
			require('plugins.configs.themes')
		end,
	}

	-- Colorizer
	use{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('plugins.configs.others')
		end,
	}

	-- The statusline
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true,},
		config = function()
			require('plugins.configs.statusline')
		end,
	}

	-- The filemanager
	use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require('plugins.configs.nvim-tree')
		end
	}

	-- The tree-sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('plugins.configs.others')
		end
	}
	use 'nvim-treesitter/playground'

	-- Autoparens
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('plugins.configs.others')
		end
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require('plugins.configs.telescope')
		end
	}

	-- The LSP stuff
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.configs.lspconfig')
		end
	}
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'glepnir/lspsaga.nvim'
end)
