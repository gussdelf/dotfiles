-- This is the file to manage the plugins
--
-- Adding packer.nvim
vim.cmd [[ packadd packer.nvim ]]

require "packer_compiled"

return require("packer").startup {
	function()
		use "wbthomason/packer.nvim"
		use "nvim-lua/plenary.nvim"

		use {
			"lewis6991/impatient.nvim",
			config = function()
				require "impatient"
			end,
		}

		-- Ui
		use {
			{
				"EdenEast/nightfox.nvim",
				event = "VimEnter",
				config = function()
					require("plugins.configs.others").theme()
				end,
			},
			{
				"kyazdani42/nvim-web-devicons",
				after = "nightfox.nvim",
			},
			{
				"nvim-lualine/lualine.nvim",
				after = "nightfox.nvim",
				config = function()
					require "plugins.configs.lualine"
				end,
			},
			{
				"akinsho/bufferline.nvim",
				after = "nvim-web-devicons",
				config = function()
					require("plugins.configs.others").bufferline()
				end,
			},
		}

		-- Treesitter
		use {
			{
				"nvim-treesitter/nvim-treesitter",
				event = "BufRead",
				config = function()
					require "plugins.configs.treesitter"
				end,
			},
			{
				"windwp/nvim-ts-autotag",
				ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "typescriptcommon" },
				config = function()
					require("plugins.configs.others").autotags()
				end,
			},
			{
				"p00f/nvim-ts-rainbow",
				after = "nvim-treesitter",
				config = function()
					require("plugins.configs.others").tsrainbow()
				end,
			},
			{
				"norcalli/nvim-colorizer.lua",
				config = function()
					require("plugins.configs.others").colorizer()
				end,
			},
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
				{
					"nvim-telescope/telescope-frecency.nvim",
					requires = { "tami5/sqlite.lua" },
				},
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"jvgrootveld/telescope-zoxide",
			},
			config = function()
				require "plugins.configs.telescope"
			end,
		}

		-- Editor utils plugins
		use {
			{
				"phaazon/hop.nvim",
				event = "BufWinEnter",
				config = function()
					require("plugins.configs.others").hop()
				end,
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = function()
					require("plugins.configs.others").autopairs()
				end,
			},
			{
				"numToStr/Comment.nvim",
				config = function()
					require("plugins.configs.others").comment()
				end,
			},
		}

		-- Snippets
		use {
			{
				"rafamadriz/friendly-snippets",
				evert = "InsertCharPre",
			},
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				after = "nvim-cmp",
				config = function()
					require("plugins.configs.others").luasnip()
				end,
			},
		}

		-- Cmp
		use {
			{
				"hrsh7th/nvim-cmp",
				-- after = "friendly-snippets",
				-- event = "InsertEnter",
				ft = lspLangs,
				config = function()
					require "plugins.configs.cmp"
				end,
			},
			{
				"saadparwaiz1/cmp_luasnip",
				after = "LuaSnip",
			},
			{
				"hrsh7th/cmp-nvim-lua",
				after = "cmp_luasnip",
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				after = "cmp-nvim-lua",
			},
			{
				"hrsh7th/cmp-buffer",
				after = "cmp-nvim-lsp",
			},
			{
				"hrsh7th/cmp-path",
				after = "cmp-buffer",
			},
			{
				"andersevenrud/cmp-tmux",
				after = "cmp-buffer",
			},
		}

		-- Lsp stuff
		use {
			{
				"neovim/nvim-lspconfig",
				ft = lspLangs,
				config = function()
					require "plugins.configs.lspconfig"
				end,
			},
			{
				"ray-x/lsp_signature.nvim",
				ft = lspLangs,
				config = function()
					require("plugins.configs.others").signature()
				end,
			},
			{
				"ray-x/navigator.lua",
				ft = lspLangs,
				requires = {
					"ray-x/guihua.lua",
					run = "cd lua/fzy && make",
				},
				config = function()
					require("plugins.configs.others").navigator()
				end,
			},
			{
				"jose-elias-alvarez/null-ls.nvim",
				ft = lspLangs,
				config = function()
					require("plugins.configs.others").null_ls()
				end,
			},
		}

		-- Etc
		use {
			{
				"akinsho/toggleterm.nvim",
				event = "BufWinEnter",
				config = function()
					require "plugins.configs.term"
				end,
			},
			{
				"iamcco/markdown-preview.nvim",
				ft = { "markdown" },
				run = "cd app && yarn install",
			},
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
