-- This is the file to manage the plugins
--
-- Adding packer.nvim
vim.cmd [[ packadd packer.nvim ]]

require "packer_compiled"

return require("packer").startup {
	function()
		use "wbthomason/packer.nvim"

		-- Impacient
		use {
			"lewis6991/impatient.nvim",
			config = function()
				require "impatient"
			end,
		}

		use "nvim-lua/plenary.nvim"

		-- Theme
		use {
			"EdenEast/nightfox.nvim",
			event = "VimEnter",
			config = function()
				require("plugins.configs.others").theme()
			end,
		}

		use {
			"kyazdani42/nvim-web-devicons",
			after = "nightfox.nvim",
		}

		-- Lualine
		use {
			"nvim-lualine/lualine.nvim",
			after = "nightfox.nvim",
			config = function()
				require "plugins.configs.lualine"
			end,
		}

		-- Bufferline
		use {
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			setup = function()
				require("user.keys").bufferline()
			end,
			config = function()
				require("plugins.configs.others").bufferline()
			end,
		}

		-- Tree-sitter
		use {
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			config = function()
				require "plugins.configs.treesitter"
			end,
		}

		use {
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
			config = function()
				require("plugins.configs.others").autotags()
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
			setup = function()
				require("user.keys").colorizer()
			end,
			config = function()
				require("plugins.configs.others").colorizer()
			end,
		}

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			event = "BufWinEnter",
			requires = {
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make all",
				},
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"jvgrootveld/telescope-zoxide",
			},
			setup = function()
				require("user.keys").telescope()
			end,
			config = function()
				require "plugins.configs.telescope"
			end,
		}

		-- Hop
		use {
			"phaazon/hop.nvim",
			event = "BufWinEnter",
			setup = function()
				require("user.keys").hop()
			end,
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
		use {
			"rafamadriz/friendly-snippets",
			evert = "InsertCharPre",
		}

		use {
			"hrsh7th/nvim-cmp",
			after = "nvim-lspconfig",
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
			after = "cmp-nvim-lua",
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
			ft = {
				"python",
				"c",
				"cpp",
				"go",
				"typescript",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"typescriptcommon",
				"sh",
				"bash",
				"lua",
				"html",
				"css",
				"rust",
				"css",
			},
			setup = function()
				require("user.keys").lspconfig()
			end,
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
			event = "InsertEnter",
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
				require("user.keys").neoformat()
			end,
		}

		-- Commenter
		use {
			"numToStr/Comment.nvim",
			config = function()
				require("plugins.configs.others").comment()
			end,
		}
	end,

	config = {
		compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		},
	},
}
