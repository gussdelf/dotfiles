-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- Adding packer.nvim
vim.cmd [[ packadd packer.nvim ]]

require "packer_compiled"

return require("packer").startup {
	function()
		use "wbthomason/packer.nvim"
		use "nvim-lua/plenary.nvim"

		-- Improve startup time
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
				requires = { "sainnhe/gruvbox-material", "sainnhe/everforest" },
				config = function()
					require("plugins.configs.others").nightfox()
				end,
			},
			{
				"kyazdani42/nvim-web-devicons",
				after = "nightfox.nvim",
			},
			{
				"nvim-lualine/lualine.nvim",
				opt = true,
				after = "nightfox.nvim",
				config = function()
					require("plugins.configs.others").lualine()
				end,
			},
			--  TODO:: Finish my feline config.
			-- {
			-- 	"feline-nvim/feline.nvim",
			-- 	opt = true,
			-- 	after = "nightfox.nvim",
			-- 	config = function()
			-- 		require "plugins.configs.feline"
			-- 	end,
			-- },
			{
				"akinsho/bufferline.nvim",
				opt = true,
				event = "BufAdd",
				config = function()
					require("plugins.configs.others").bufferline()
				end,
			},
		}

		-- Treesitter
		use {
			--  PERF:: I think this can get a little bit faster.
			{
				"nvim-treesitter/nvim-treesitter",
				ft = tsFileTypes,
				config = function()
					require "plugins.configs.treesitter"
				end,
			},
			{
				"windwp/nvim-ts-autotag",
				opt = true,
				ft = {
					"html",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"typescriptcommon",
					"vue",
				},
				config = function()
					require("plugins.configs.others").autotags()
				end,
			},
			{
				"p00f/nvim-ts-rainbow",
				opt = true,
				after = "nvim-treesitter",
				config = function()
					require("plugins.configs.others").tsrainbow()
				end,
			},
			{
				"norcalli/nvim-colorizer.lua",
				opt = true,
				config = function()
					require("plugins.configs.others").colorizer()
				end,
			},
		}

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			event = "BufWinEnter",
			requires = {
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make all",
				},
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"jvgrootveld/telescope-zoxide",
				-- opt = true,
			},
			config = function()
				require "plugins.configs.telescope"
			end,
		}

		-- Some utils plugins
		use {
			{
				"phaazon/hop.nvim",
				event = "BufWinEnter",
				config = function()
					require("plugins.configs.others").hop()
				end,
			},
			{
				"booperlv/nvim-gomove",
				event = "BufWinEnter",
				config = function()
					require("plugins.configs.others").gomove()
				end,
			},
			{
				"windwp/nvim-autopairs",
				after = "nvim-cmp",
				config = function()
					require("plugins.configs.others").autopairs()
				end,
			},
			{
				"numToStr/Comment.nvim",
				-- opt = true,
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
				after = "nvim-cmp",
				wants = "friendly-snippets",
				config = function()
					require("plugins.configs.others").luasnip()
				end,
			},
		}

		-- Cmp
		use {
			{
				"hrsh7th/nvim-cmp",
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
			-- {
			-- 	"nvim-lua/lsp-status.nvim",
			-- },
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
				"folke/trouble.nvim",
				ft = lspLangs,
				-- after = "nvim-lspconfig",
				config = function()
					require("plugins.configs.others").trouble()
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
				opt = true,
				event = "BufWinEnter",
				config = function()
					require "plugins.configs.term"
				end,
			},
			{
				"iamcco/markdown-preview.nvim",
				opt = true,
				ft = { "markdown" },
				run = "cd app && yarn install",
			},
			{
				"andymass/vim-matchup",
				opt = true,
				ft = lspLangs,
				config = function()
					require("plugins.configs.others").matchup()
				end,
			},
			{
				"folke/todo-comments.nvim",
				ft = lspLangs,
				config = function()
                    require("plugins.configs.others").todo()
				end,
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
