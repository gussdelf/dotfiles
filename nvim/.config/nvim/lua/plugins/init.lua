-- This is the file to manage the plugins
--
-- Adding packer.nvim
vim.cmd [[ packadd packer.nvim ]]

return require("packer").startup(function()
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
	}

	use "wbthomason/packer.nvim"

	-- Impacient
	use {
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	}

	use "nvim-lua/plenary.nvim"
	use "kyazdani42/nvim-web-devicons"

	-- Themes
	use {
		"sainnhe/everforest",
		requires = {
			"sainnhe/gruvbox-material",
			"tomasiser/vim-code-dark",
			"shaunsingh/nord.nvim",
			opt = true,
		},
		config = function()
			require "plugins.configs.theme"
		end,
	}

	-- Lualine
	use {
		"nvim-lualine/lualine.nvim",
		event = "BufWinEnter",
		config = function()
			require "plugins.configs.lualine"
		end,
	}

	-- Bufferline
	use {
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.configs.others").bufferline()
		end,
	}
	-- Tree-sitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufWinEnter",
		config = function()
			require "plugins.configs.treesitter"
		end,
	}

	use {
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		after = "nvim-treesitter",
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	}

	use {
		"p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
		config = function()
			require("plugins.configs.others").tsrainbow()
		end,
	}

	-- Colorizer
	use {
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		event = "BufWinEnter",
		requires = {
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"jvgrootveld/telescope-zoxide",
		},
		config = function()
			require "plugins.configs.telescope"
		end,
	}

	-- Hop
	use {
		"phaazon/hop.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugins.configs.others").hop()
		end,
	}

	-- Terminal
	use {
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		config = function()
			require "plugins.configs.term"
		end,
	}
	-- Markdown preview
	use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

	-- Cmp
	use "rafamadriz/friendly-snippets"

	use {
		"hrsh7th/nvim-cmp",
		config = function()
			require "plugins.configs.cmp"
		end,
	}
	use {
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").luasnip()
		end,
	}
	use {
		"saadparwaiz1/cmp_luasnip",
		after = "LuaSnip",
	}
	use {
		"hrsh7th/cmp-nvim-lua",
		after = "cmp_luasnip",
	}

	use {
		"hrsh7th/cmp-nvim-lsp",
		after = "cmp_luasnip",
	}
	use {
		"hrsh7th/cmp-buffer",
		after = "cmp-nvim-lsp",
	}
	use {
		"hrsh7th/cmp-path",
		after = "cmp-buffer",
	}
	use {
		"andersevenrud/cmp-tmux",
		after = "cmp-buffer",
	}

	-- Lsp stuff
	use {
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = function()
			require "plugins.configs.lspconfig"
		end,
	}
	use {
		"ray-x/lsp_signature.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.others").signature()
		end,
	}

	-- Autopairs
	use {
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").autopairs()
		end,
	}

	-- Neoformat
	use {
		"sbdchd/neoformat",
		event = "BufWinEnter",
		cmd = "Neoformat",
		config = function()
			require("plugins.configs.others").neoformat()
		end,
	}
end)
